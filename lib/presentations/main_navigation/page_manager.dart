import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/components/widget_bottom_nav.dart';
import 'package:jci_manila_v2/app/components/widget_drawer.dart';
import 'package:jci_manila_v2/app/components/widget_fab.dart';
import 'package:jci_manila_v2/presentations/main_navigation/benefits/benefits_page.dart';
import 'package:jci_manila_v2/presentations/main_navigation/calendar/calendar_page.dart';
import 'package:jci_manila_v2/presentations/main_navigation/events/event_page.dart';
import 'package:jci_manila_v2/presentations/main_navigation/home/home_page.dart';

class PageManager extends StatefulWidget {
  const PageManager({super.key});

  @override
  State<PageManager> createState() => _PageManagerState();
}

class _PageManagerState extends State<PageManager> {
  int currentIndex = 0;

  final List<Widget> pages = [
    HomePage(),
    EventPage(),
    Center(child: Text('Games')),
    BenefitsPage(),
    CalendarPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: WidgetBottomNav(
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [Icon(Icons.home_outlined), Text('Home')],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [Icon(Icons.confirmation_num_outlined), Text('Event')],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [Icon(Icons.sports_esports_outlined), Text('Games')],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [Icon(Icons.shopping_bag_outlined), Text('Benefits')],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [Icon(Icons.calendar_month), Text('Calendar')],
            ),
          ],
        ),
        endDrawer: WidgetDrawer(),
        floatingActionButton: WidgetFab(onPressed: () {}),
      ),
    );
  }
}
