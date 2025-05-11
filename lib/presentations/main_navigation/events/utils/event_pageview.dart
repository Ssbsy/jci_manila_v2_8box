import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/app/widgets/widget_search_bar.dart';
import 'package:jci_manila_v2/core/base_api/base_api.dart';
import 'package:jci_manila_v2/core/services/events/all_events_services.dart';
import 'package:jci_manila_v2/presentations/main_navigation/events/utils/event_content.dart';

class EventPageview extends StatefulWidget {
  const EventPageview({super.key});

  @override
  State<EventPageview> createState() => _EventPageviewState();
}

class _EventPageviewState extends State<EventPageview> {
  final searchController = TextEditingController();
  late Future<List<EventModel>> futureEvents = Future.value([]);

  @override
  void initState() {
    super.initState();
    fetchEvents().then((events) {
      debugPrint("Loaded events count: ${events.length}");
      setState(() {
        futureEvents = Future.value(events);
      });
    });
  }

  Future<List<EventModel>> fetchEvents() async {
    try {
      final service = AllEventsService(BaseApiServices());
      final response = await service.getAllEvents();

      if (response['success'] == true && response['data'] != null) {
        final data = response['data'] as List;

        return data.map((e) {
          return EventModel(
            id: int.tryParse(e['id'].toString()) ?? 0,
            title: e['title'] ?? '',
            description: _stripHtmlTags(e['description'] ?? ''),
            location: e['address'] ?? 'No location',
            dateTime: _formatDateWithTime(e['date'], e['end_date'], e['time']),
            imagePath:
                e['banner_picture']?.toString().replaceAll('/../', '/') ??
                'assets/images/event.png',
            isMyEvent: false,
          );
        }).toList();
      } else {
        debugPrint('API returned empty or failed: $response');
        return [];
      }
    } catch (e) {
      debugPrint('Error fetching all events: $e');
      return [];
    }
  }

  String _stripHtmlTags(String html) {
    return html.replaceAll(RegExp(r'<[^>]*>'), '').trim();
  }

  String _formatDateWithTime(
    String? startDateStr,
    dynamic endDateStr,
    String? timeStr,
  ) {
    if (startDateStr == null || startDateStr.isEmpty) return '';
    final start = DateTime.tryParse(startDateStr);
    final end =
        endDateStr != null ? DateTime.tryParse(endDateStr.toString()) : null;

    if (start == null) return startDateStr;

    final startFormatted = "${_monthName(start.month)} ${start.day}";
    final endFormatted =
        end != null
            ? (start.month == end.month && start.year == end.year)
                ? "–${end.day}, ${start.year}"
                : "–${_monthName(end.month)} ${end.day}, ${end.year}"
            : ", ${start.year}";

    final formattedTime = _formatTime(timeStr);
    return "$startFormatted$endFormatted$formattedTime";
  }

  String _formatTime(String? timeStr) {
    if (timeStr == null || timeStr.isEmpty) return '';
    try {
      final parts = timeStr.split(':');
      final hour = int.parse(parts[0]);
      final minute = int.parse(parts[1]);
      final period = hour >= 12 ? 'PM' : 'AM';
      final hour12 = hour % 12 == 0 ? 12 : hour % 12;

      return " | $hour12:${minute.toString().padLeft(2, '0')} $period";
    } catch (_) {
      return '';
    }
  }

  String _monthName(int month) {
    const months = [
      '',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month];
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
          return const Center(child: Text('No events available.'));
        }

        final eventList = snapshot.data!;
        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          children: [
            WidgetSearchBar(controller: searchController),
            const Gap(10),
            ...eventList.map((event) => EventContent(event: event)),
          ],
        );
      },
    );
  }
}
