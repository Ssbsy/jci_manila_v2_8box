import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/app/widgets/widget_search_bar.dart';
import 'package:jci_manila_v2/presentations/main_navigation/events/utils/event_content.dart';

class MyEventsPageview extends StatefulWidget {
  const MyEventsPageview({super.key});

  @override
  State<MyEventsPageview> createState() => _MyEventsPageviewState();
}

class _MyEventsPageviewState extends State<MyEventsPageview> {
  final controller = TextEditingController();

  final List<EventModel> myEventList = [
    EventModel(
      title: "Asia Pacific Conference - Mongolia, Ulaanbaatar",
      description: "Join us for an exciting onto in this year’s JCI Asia",
      location: "Ulaanbaatar, Mongolia",
      dateTime: "June 11–16, 2025 | 8:00 AM",
      imagePath: "assets/images/event.png",
      registrants: 8,
      isMyEvent: true,
    ),
    EventModel(
      title: "JCI Youth Summit - Philippines",
      description: "Empowering the next generation of leaders in JCI.",
      location: "Manila, Philippines",
      dateTime: "July 5, 2025 | 9:00 AM",
      imagePath: "assets/images/event.png",
      registrants: 12,
      isMyEvent: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      children: [
        WidgetSearchBar(controller: controller),
        const Gap(10),
        ...myEventList.map((event) => EventContent(event: event)).toList(),
      ],
    );
  }
}
