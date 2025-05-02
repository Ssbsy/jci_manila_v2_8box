import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/components/widget_custom_appbar.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WidgetCustomAppbar(
          title: 'Calendar',
          textColor: Colors.white,
          fontSize: 20,
          isbold: true,
        ),
      ],
    );
  }
}
