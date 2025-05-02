import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
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
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            WidgetSearchBar(controller: searchController),
            EventContent(),
            EventContent(),
          ],
        ),
      ),
    );
  }
}
