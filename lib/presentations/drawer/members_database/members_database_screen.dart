import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/app/components/widget_custom_appbar.dart';
import 'package:jci_manila_v2/app/components/widget_drawer.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_search_bar.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';

class MembersDatabaseScreen extends StatefulWidget {
  const MembersDatabaseScreen({super.key});

  @override
  State<MembersDatabaseScreen> createState() => _MembersDatabaseScreenState();
}

class _MembersDatabaseScreenState extends State<MembersDatabaseScreen> {
  final controller = TextEditingController();
  String selectedTab = 'All';
  final List<String> tabs = ['All', 'Senator', 'Baby JC', 'Director'];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Column(
          children: [
            WidgetCustomAppbar(
              title: 'Members Database',
              textColor: Colors.white,
              isbold: true,
            ),
            const Gap(10),
            WidgetSearchBar(controller: controller),
            const Gap(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Wrap(
                spacing: 10,
                children: tabs.map((tab) => _nav(tab)).toList(),
              ),
            ),
            const Gap(10),
          ],
        ),
        endDrawer: WidgetDrawer(),
      ),
    );
  }

  GestureDetector _nav(String title) {
    final isSelected = selectedTab == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = title;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        decoration: BoxDecoration(
          color: isSelected ? Palette.veryDarkBlueGray : Colors.transparent,
          border: Border.all(
            width: 1,
            color: isSelected ? Palette.veryDarkBlueGray : Palette.black,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: WidgetText(
          title: title,
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
