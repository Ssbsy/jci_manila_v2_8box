import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/components/widget_custom_appbar.dart';
import 'package:jci_manila_v2/app/components/widget_drawer.dart';
import 'package:jci_manila_v2/presentations/drawer/settings/widgets/settings_info.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: WidgetDrawer(),
      body: Column(
        children: const [
          WidgetCustomAppbar(
            title: 'Settings',
            textColor: Colors.white,
            isbold: true,
          ),
          Expanded(child: SettingsInfo()),
        ],
      ),
    );
  }
}
