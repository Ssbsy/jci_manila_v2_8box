import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
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
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FABController.showFAB.value = true;
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
            const ProjectsScreenContent(),
          ],
        ),
        endDrawer: const WidgetDrawer(),

        floatingActionButton: ValueListenableBuilder<bool>(
          valueListenable: FABController.showFAB,
          builder: (context, show, _) {
            if (!show) return const SizedBox.shrink();
            return WidgetFab(onPressed: () => Get.toNamed('/addProject'));
          },
        ),
      ),
    );
  }
}
