import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:jci_manila_v2/app/components/widget_custom_appbar.dart';
import 'package:jci_manila_v2/app/components/widget_drawer.dart';
import 'package:jci_manila_v2/core/constants/images.dart';

class SponsorsScreen extends StatefulWidget {
  const SponsorsScreen({super.key});

  @override
  State<SponsorsScreen> createState() => _SponsorsScreenState();
}

class _SponsorsScreenState extends State<SponsorsScreen> {
  final List<Widget> contents = [
    Images.sponsorsContent01,
    Images.sponsorsContent02,
    Images.sponsorsContent03,
    Images.sponsorsContent04,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            WidgetCustomAppbar(
              title: 'Sponsors',
              textColor: Colors.white,
              isbold: true,
            ),
            ...List.generate(
              contents.length,
              (index) => Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  onTap: () => Get.offAllNamed('/sponsorDetails'),
                  child: contents[index],
                ),
              ),
            ),
          ],
        ),
      ),
      endDrawer: WidgetDrawer(),
    );
  }
}
