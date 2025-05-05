import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/app/components/widget_custom_appbar.dart';
import 'package:jci_manila_v2/app/components/widget_drawer.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_search_bar.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/core/constants/images.dart';
import 'package:jci_manila_v2/core/models/members_database_model.dart';
import 'package:jci_manila_v2/presentations/drawer/members_database/screens/members_database_details_screen.dart';
import 'package:jci_manila_v2/presentations/drawer/members_database/utils/members_database_content.dart';

class MembersDatabaseScreen extends StatefulWidget {
  const MembersDatabaseScreen({super.key});

  @override
  State<MembersDatabaseScreen> createState() => _MembersDatabaseScreenState();
}

class _MembersDatabaseScreenState extends State<MembersDatabaseScreen> {
  final controller = TextEditingController();
  String selectedTab = 'All';
  final List<String> tabs = ['All', 'Senator', 'Baby JC', 'Director'];

  final List<MembersDatabaseModel> database = [
    MembersDatabaseModel(
      firstName: 'Sean Patrick',
      lastName: 'Si',
      type: 'Associate',
      badge: Images.yellowBadge,
    ),
    MembersDatabaseModel(
      firstName: 'Sean Patrick',
      lastName: 'Si',
      type: 'Regular',
      badge: Images.silverBadge,
    ),
    MembersDatabaseModel(
      firstName: 'Sean Patrick',
      lastName: 'Si',
      type: 'Senate',
      badge: Images.brownBadge,
    ),
    MembersDatabaseModel(
      firstName: 'Sean Patrick',
      lastName: 'Si',
      type: 'Regular',
      badge: Images.silverBadge,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    debugPrint('Database length: ${database.length}');
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
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
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Wrap(
                  spacing: 5,
                  children: tabs.map((tab) => _nav(tab)).toList(),
                ),
              ),
              const Gap(15),
              ...List.generate(database.length, (index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (_) => MembersDatabaseDetailsScreen(
                                  database: database[index],
                                ),
                          ),
                        );
                      },
                      child: MembersDatabaseContent(database: database[index]),
                    ),
                    const Gap(15),
                  ],
                );
              }),
            ],
          ),
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
