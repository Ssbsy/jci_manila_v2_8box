import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/components/widget_custom_appbar.dart';
import 'package:jci_manila_v2/presentations/main_navigation/events/utils/event_body.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WidgetCustomAppbar(
          title: 'Event',
          textColor: Colors.white,
          fontSize: 20,
          isbold: true,
        ),
        Expanded(child: EventBody()),
      ],
    );
  }
}
