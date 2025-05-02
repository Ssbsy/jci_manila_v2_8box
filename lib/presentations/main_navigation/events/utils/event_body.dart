import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/presentations/main_navigation/events/utils/event_pageview.dart';
import 'package:jci_manila_v2/presentations/main_navigation/events/utils/my_events_pageview.dart';

class EventBody extends StatefulWidget {
  const EventBody({super.key});

  @override
  State<EventBody> createState() => _EventBodyState();
}

class _EventBodyState extends State<EventBody> {
  int currentIndex = 0;
  final List<Widget> pages = [EventPageview(), MyEventsPageview()];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildTab(title: 'Events', index: 0),
            _buildTab(title: 'My Events', index: 1),
          ],
        ),
        const Gap(20),
        pages[currentIndex],
      ],
    );
  }

  Widget _buildTab({
    required String title,
    required int index,
    double size = 16,
  }) {
    final isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () => setState(() => currentIndex = index),
      child: Column(
        children: [
          WidgetText(
            title: title,
            isBold: true,
            color: isSelected ? Colors.blue : Colors.black,
            size: size,
          ),
          const Gap(5),
          Container(
            height: 2,
            width: MediaQuery.of(context).size.width * 0.5,
            color: isSelected ? Colors.blue : Colors.transparent,
          ),
        ],
      ),
    );
  }
}
