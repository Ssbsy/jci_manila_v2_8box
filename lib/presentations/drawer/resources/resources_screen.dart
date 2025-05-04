import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/components/widget_custom_appbar.dart';
import 'package:jci_manila_v2/app/components/widget_drawer.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';

class ResourcesScreen extends StatelessWidget {
  const ResourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          WidgetCustomAppbar(
            title: 'Resources',
            textColor: Colors.white,
            isbold: true,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              spacing: 10,
              children: [
                _row('History'),
                _row('Creed'),
                _row('Board of Directors'),
              ],
            ),
          ),
        ],
      ),
      endDrawer: WidgetDrawer(),
    );
  }

  GestureDetector _row(String title, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        spacing: 10,
        children: [
          Icon(Icons.house_outlined, size: 20),
          WidgetText(title: title, size: 16),
        ],
      ),
    );
  }
}
