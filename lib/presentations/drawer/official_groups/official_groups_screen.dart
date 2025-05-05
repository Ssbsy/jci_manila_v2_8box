import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/app/components/widget_custom_appbar.dart';
import 'package:jci_manila_v2/app/components/widget_drawer.dart';
import 'package:jci_manila_v2/app/widgets/widget_search_bar.dart';
import 'package:jci_manila_v2/core/models/group.dart';
import 'package:jci_manila_v2/presentations/drawer/official_groups/screens/group_details_screen.dart';
import 'package:jci_manila_v2/presentations/drawer/official_groups/utils/group_items.dart';

class OfficialGroupsScreen extends StatefulWidget {
  const OfficialGroupsScreen({super.key});

  @override
  State<OfficialGroupsScreen> createState() => _OfficialGroupsScreenState();
}

class _OfficialGroupsScreenState extends State<OfficialGroupsScreen> {
  final controller = TextEditingController();

  final List<Group> groups = [
    Group(
      id: 1,
      name: 'Basketball Group One',
      description: 'The official group for Group One',
      members: 176,
    ),
    Group(
      id: 2,
      name: 'Football Group',
      description: 'Official Football community',
      members: 98,
    ),
    Group(
      id: 3,
      name: 'Volleyball Fans',
      description: 'Join volleyball meetups',
      members: 143,
    ),
    Group(
      id: 4,
      name: 'Chess Circle',
      description: 'Friendly chess tournaments',
      members: 57,
    ),
    Group(
      id: 5,
      name: 'Cycling Squad',
      description: 'Group rides every weekend',
      members: 210,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            WidgetCustomAppbar(
              title: 'Official Groups',
              textColor: Colors.white,
              isbold: true,
            ),
            const Gap(10),
            WidgetSearchBar(controller: controller),
            const Gap(10),
            ...List.generate(
              groups.length,
              (index) => GestureDetector(
                onTap:
                    () => showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.8,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          child: GroupDetailsScreen(group: groups[index]),
                        );
                      },
                    ),
                child: GroupItems(group: groups[index]),
              ),
            ),
          ],
        ),
      ),
      endDrawer: const WidgetDrawer(),
    );
  }
}
