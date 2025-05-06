import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/app/components/widget_custom_appbar.dart';
import 'package:jci_manila_v2/app/components/widget_drawer.dart';
import 'package:jci_manila_v2/core/constants/fab_controller.dart';
import 'package:jci_manila_v2/presentations/main_navigation/events/utils/event_body.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FABController.showFAB.value = false;
      FABController.fabDesignType.value = FABDesignType.defaultFab;
    });
  }

  void _handleTabChange(int index) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final isMyEvents = index == 1;
      FABController.showFAB.value = isMyEvents;
      FABController.fabDesignType.value =
          isMyEvents ? FABDesignType.altFab : FABDesignType.defaultFab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const WidgetCustomAppbar(
            title: 'Event',
            textColor: Colors.white,
            fontSize: 20,
            isbold: true,
          ),
          const Gap(10),
          Expanded(child: EventBody(onTabChanged: _handleTabChange)),
        ],
      ),
      endDrawer: const WidgetDrawer(),
    );
  }
}
