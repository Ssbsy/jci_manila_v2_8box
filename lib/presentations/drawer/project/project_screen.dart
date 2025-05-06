import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/app/components/widget_custom_appbar.dart';
import 'package:jci_manila_v2/app/components/widget_drawer.dart';
import 'package:jci_manila_v2/app/components/widget_fab.dart';
import 'package:jci_manila_v2/app/widgets/widget_search_bar.dart';
import 'package:jci_manila_v2/core/constants/fab_controller.dart';
import 'package:jci_manila_v2/presentations/drawer/project/utils/projects_screen_content.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FABController.showFAB.value = true;
      FABController.fabDesignType.value = FABDesignType.altFab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Column(
          children: [
            WidgetCustomAppbar(
              title: 'Projects',
              textColor: Colors.white,
              isbold: true,
            ),
            const Gap(10),
            WidgetSearchBar(controller: searchController),
            const Gap(10),
            ProjectsScreenContent(),
          ],
        ),
        endDrawer: WidgetDrawer(),
        floatingActionButton: WidgetFab(onPressed: () {}),
      ),
    );
  }
}
