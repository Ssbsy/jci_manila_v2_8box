import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/presentations/drawer/project/components/project_appbar.dart';
import 'package:jci_manila_v2/presentations/drawer/project/screens/committee_member_screen.dart';
import 'package:jci_manila_v2/presentations/drawer/project/screens/project_information_screen.dart';

class ProjectDetailsScreen extends StatefulWidget {
  const ProjectDetailsScreen({super.key});

  @override
  State<ProjectDetailsScreen> createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const ProjectInformationScreen(),
    const CommitteeMemberScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProjectAppbar(),
            Row(
              children: [
                _buildTab(title: 'Project Information', index: 0),
                _buildTab(title: 'Committee Members', index: 1),
              ],
            ),
            Expanded(child: pages[currentIndex]),
          ],
        ),
      ),
    );
  }

  Widget _buildTab({
    required String title,
    required int index,
    double size = 16,
  }) {
    final isSelected = currentIndex == index;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: GestureDetector(
        onTap: () => setState(() => currentIndex = index),
        child: Column(
          children: [
            WidgetText(
              title: title,
              isBold: true,
              color: isSelected ? Palette.primary : Colors.black,
              size: size,
            ),
            const SizedBox(height: 5),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width * 0.5,
              color: isSelected ? Colors.blue : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
