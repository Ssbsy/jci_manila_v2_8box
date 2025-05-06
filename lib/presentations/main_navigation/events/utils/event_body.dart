import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/presentations/main_navigation/events/utils/event_pageview.dart';
import 'package:jci_manila_v2/presentations/main_navigation/events/utils/my_events_pageview.dart';

class EventBody extends StatefulWidget {
  final ValueChanged<int>? onTabChanged;

  const EventBody({super.key, this.onTabChanged});

  @override
  State<EventBody> createState() => _EventBodyState();
}

class _EventBodyState extends State<EventBody> {
  int currentIndex = 0;

  final List<Widget> pages = const [EventPageview(), MyEventsPageview()];

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
        const Gap(10),
        Expanded(child: IndexedStack(index: currentIndex, children: pages)),
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
      onTap: () {
        if (currentIndex == index) return;
        setState(() => currentIndex = index);
        widget.onTabChanged?.call(index);
      },
      child: Column(
        children: [
          WidgetText(
            title: title,
            size: size,
            isBold: true,
            color: isSelected ? Palette.accentBlue : Colors.black,
          ),
          const Gap(5),
          Container(
            height: 2,
            width: MediaQuery.of(context).size.width * 0.4,
            color: isSelected ? Palette.accentBlue : Colors.transparent,
          ),
        ],
      ),
    );
  }
}
