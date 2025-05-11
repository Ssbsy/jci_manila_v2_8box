import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:jci_manila_v2/app/widgets/widget_search_bar.dart';
import 'package:jci_manila_v2/core/base_api/base_api.dart';
import 'package:jci_manila_v2/core/services/events/my_events_list_services.dart';
import 'package:jci_manila_v2/presentations/main_navigation/events/utils/event_content.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyEventsPageview extends StatefulWidget {
  const MyEventsPageview({super.key});

  @override
  State<MyEventsPageview> createState() => _MyEventsPageviewState();
}

class _MyEventsPageviewState extends State<MyEventsPageview> {
  final controller = TextEditingController();
  late Future<List<EventModel>> futureEvents;

  @override
  void initState() {
    super.initState();
    futureEvents = fetchMyEvents();
  }

  Future<List<EventModel>> fetchMyEvents() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userId = prefs.getInt('user_id');
      debugPrint('Fetched user_id: $userId');

      if (userId == null) {
        debugPrint('No user ID found in SharedPreferences.');
        return [];
      }

      final service = MyEventsListServices(BaseApiServices());
      final response = await service.postMyEventList(userId: userId);

      if (response['success'] == true && response['data'] != null) {
        return (response['data'] as List).map((e) {
          return EventModel(
            id: e['id'] ?? 0,
            title: e['title'] ?? '',
            description: _stripHtmlTags(e['description'] ?? ''),
            location: '', // Optional: use e['address'] if available
            dateTime: _formatDateRange(e['date'] ?? ''),
            imagePath: e['banner_picture'] ?? 'assets/images/event.png',
            registrants: e['registrations'] ?? 0,
            isMyEvent: true,
          );
        }).toList();
      } else {
        debugPrint('API returned empty or failed: $response');
        return [];
      }
    } catch (e) {
      debugPrint('Error fetching events: $e');
      return [];
    }
  }

  String _stripHtmlTags(String html) {
    return html.replaceAll(RegExp(r'<[^>]*>'), '').trim();
  }

  String _formatDateRange(String rawDate) {
    try {
      if (rawDate.contains('-') && rawDate.contains(' ')) {
        final parts = rawDate.split('-').map((e) => e.trim()).toList();
        final start = DateTime.parse(parts[0]);
        final end = DateTime.parse(parts[1]);

        final sameMonth = start.month == end.month && start.year == end.year;
        final startFormat = DateFormat('MMMM d');
        final endFormat = sameMonth ? DateFormat('d') : DateFormat('MMMM d');

        return "${startFormat.format(start)}–${endFormat.format(end)}, ${end.year}";
      } else {
        final date = DateTime.parse(rawDate);
        return DateFormat('MMMM d, y').format(date);
      }
    } catch (e) {
      debugPrint("Date formatting error: $e");
      return rawDate; // fallback
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<EventModel>>(
      future: futureEvents,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No events found.'));
        }

        final myEventList = snapshot.data!;
        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          children: [
            WidgetSearchBar(controller: controller),
            const Gap(10),
            ...myEventList.map((event) => EventContent(event: event)),
          ],
        );
      },
    );
  }
}
