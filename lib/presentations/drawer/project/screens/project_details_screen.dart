import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/presentations/drawer/project/components/project_appbar.dart';
import 'package:jci_manila_v2/presentations/drawer/project/screens/commitee_member_screen.dart';
import 'package:jci_manila_v2/presentations/drawer/project/screens/project_information_screen.dart';

class ProjectDetailsScreen extends StatefulWidget {
  const ProjectDetailsScreen({super.key});

  @override
  State<ProjectDetailsScreen> createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ProjectAppbar(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  WidgetText(title: 'Project Information'),
                  WidgetText(title: 'Committee Members'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
