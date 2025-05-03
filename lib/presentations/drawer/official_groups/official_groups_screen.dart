import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/components/widget_custom_appbar.dart';
import 'package:jci_manila_v2/app/components/widget_drawer.dart';

class OfficialGroupsScreen extends StatelessWidget {
  const OfficialGroupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          WidgetCustomAppbar(
            title: 'Official Groups',
            textColor: Colors.white,
            isbold: true,
          ),
        ],
      ),
      endDrawer: WidgetDrawer(),
    );
  }
}
