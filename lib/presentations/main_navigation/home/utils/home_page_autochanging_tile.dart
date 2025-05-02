import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/presentations/main_navigation/home/const/assets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePageAutochangingTile extends StatefulWidget {
  const HomePageAutochangingTile({super.key});

  @override
  State<HomePageAutochangingTile> createState() =>
      _HomePageAutochangingTileState();
}

class _HomePageAutochangingTileState extends State<HomePageAutochangingTile> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late Timer _timer;

  late List<Widget> _tiles;

  @override
  void initState() {
    super.initState();

    _tiles = [
      _buildLogoTile(Assets.dashboardImg01),
      _buildLogoTile(Assets.dashboardImg01),
      _buildLogoTile(Assets.dashboardImg01),
      _buildLogoTile(Assets.dashboardImg01),
      _buildLogoTile(Assets.dashboardImg01),
      _buildLogoTile(Assets.dashboardImg01),
    ];

    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
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
    _timer.cancel();
    super.dispose();
  }

  Widget _buildLogoTile(Widget imageWidget) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: imageWidget,
    );
  }

  @override
  Widget build(BuildContext context) {
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
            itemBuilder: (context, index) {
              return _tiles[index];
            },
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
  }
}
