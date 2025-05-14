import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/presentations/drawer/project/screens/committee_member_screen.dart';
import 'package:jci_manila_v2/presentations/drawer/project/screens/project_information_screen.dart';

class ProjectDetailsScreen extends StatelessWidget {
  final int projectId;

  const ProjectDetailsScreen({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Palette.neutralWhite,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Palette.veryDarkBluishGray,
          foregroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text("Project Details"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade300, width: 1),
                ),
              ),
              child: const TabBar(
                indicatorColor: Palette.accentBlue,
                labelColor: Palette.accentBlue,
                unselectedLabelColor: Palette.neutralGray,
                tabs: [
                  Tab(text: "Project Information"),
                  Tab(text: "Committee Members"),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: ProjectInformationScreen(projectId: projectId),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: CommitteeMemberScreen(projectId: projectId),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
