import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/widgets/widget_search_bar.dart';
import 'package:jci_manila_v2/presentations/main_navigation/events/utils/event_content.dart';

class EventPageview extends StatefulWidget {
  const EventPageview({super.key});

  @override
  State<EventPageview> createState() => _EventPageviewState();
}

class _EventPageviewState extends State<EventPageview> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 12).copyWith(bottom: 20),
      children: [
        WidgetSearchBar(controller: searchController),
        const SizedBox(height: 10),
        EventContent(
          event: EventModel(
            title: "Asia Pacific Conference - Mongolia, Ulaanbaatar",
            description: "Join us for an exciting onto in this year’s JCI Asia",
            location: "Ulaanbaatar, Mongolia",
            dateTime: "June 11–16, 2025 | 8:00 AM",
            imagePath: "assets/images/event.png",
            isMyEvent: false,
          ),
        ),
        EventContent(
          event: EventModel(
            title: "Asia Pacific Conference - Mongolia, Ulaanbaatar",
            description: "Lorem ipsum dolor sit amet consectetur.",
            location: "Ulaanbaatar, Mongolia",
            dateTime: "June 11–16, 2025 | 8:00 AM",
            imagePath: "assets/images/event.png",
            isMyEvent: false,
          ),
        ),
      ],
    );
  }
}
