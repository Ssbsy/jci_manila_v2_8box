import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/core/providers/events/events_provider.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePageAutochangingTile extends StatefulWidget {
  const HomePageAutochangingTile({super.key});

  @override
  State<HomePageAutochangingTile> createState() =>
      _HomePageAutochangingTileState();
}

class _HomePageAutochangingTileState extends State<HomePageAutochangingTile>
    with AutomaticKeepAliveClientMixin {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;
  List<Widget> _tiles = [];
  bool _eventsLoaded = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _fetchEventsOnce();
    });
  }

  void _fetchEventsOnce() async {
    final provider = Provider.of<EventsProvider>(context, listen: false);
    if (provider.homeEvents.isEmpty) {
      await provider.getHomeEvents();
    }

    if (!mounted) return;

    final events = provider.homeEvents;
    setState(() {
      _tiles = events.map((event) => _buildEventTile(event)).toList();
      _eventsLoaded = true;
    });

    if (_tiles.isNotEmpty) {
      _startAutoScroll();
    }
  }

  void _startAutoScroll() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_tiles.isEmpty || !_pageController.hasClients) return;

      if (_currentPage < _tiles.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  Widget _buildEventTile(Map<String, dynamic> event) {
    final imageUrl =
        event['banner_picture'] ?? 'https://via.placeholder.com/150';

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        placeholder:
            (context, url) => const Center(child: CircularProgressIndicator()),
        errorWidget:
            (context, url, error) =>
                const Center(child: Text('Image not available')),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Consumer<EventsProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading && !_eventsLoaded) {
          return const Center(child: CircularProgressIndicator());
        }

        if (_tiles.isEmpty) {
          return const Center(child: Text('No events available'));
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.27,
              width: double.infinity,
              child: PageView.builder(
                controller: _pageController,
                itemCount: _tiles.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) => _tiles[index],
              ),
            ),
            const Gap(8),
            SmoothPageIndicator(
              controller: _pageController,
              count: _tiles.length,
              effect: ExpandingDotsEffect(
                dotHeight: 8,
                dotWidth: 8,
                spacing: 6,
                activeDotColor: Colors.white,
                dotColor: Colors.white,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
