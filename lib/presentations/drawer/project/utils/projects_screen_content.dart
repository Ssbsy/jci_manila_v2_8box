import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/core/base_api/base_api.dart';
import 'package:jci_manila_v2/core/models/project.dart';
import 'package:jci_manila_v2/core/services/projects/my_projects_services.dart';
import 'package:jci_manila_v2/presentations/drawer/project/screens/project_details_screen.dart';

class ProjectsScreenContent extends StatefulWidget {
  const ProjectsScreenContent({super.key});

  @override
  State<ProjectsScreenContent> createState() => _ProjectsScreenContentState();
}

class _ProjectsScreenContentState extends State<ProjectsScreenContent> {
  List<ProjectModel> projects = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProjects();
  }

  Future<void> fetchProjects() async {
    final response =
        await MyProjectsServices(BaseApiServices()).getMyProjects();
    if (response['success'] == true && response['data'] != null) {
      final List data = response['data'];
      setState(() {
        projects = data.map((e) => ProjectModel.fromJson(e)).toList();
        isLoading = false;
      });
    } else {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Expanded(
                flex: 2,
                child: WidgetText(title: 'Project Title', isBold: true),
              ),
              Expanded(
                flex: 1,
                child: WidgetText(title: 'BOD Status', isBold: true),
              ),
              SizedBox(width: 50),
            ],
          ),
          const Gap(10),
          if (isLoading)
            const Center(child: CircularProgressIndicator())
          else if (projects.isEmpty)
            const WidgetText(title: "No projects available.")
          else
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: projects.length,
              separatorBuilder:
                  (_, __) => const Divider(height: 20, thickness: 0.6),
              itemBuilder: (context, index) {
                final project = projects[index];
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Project title
                    Expanded(
                      flex: 2,
                      child: WidgetText(
                        title: project.projectTitle,
                        maxLine: 2,
                        size: 13,
                        color: Palette.black,
                      ),
                    ),

                    // Status
                    Expanded(
                      flex: 1,
                      child: WidgetText(
                        title: project.status,
                        size: 12,
                        color:
                            project.status.toLowerCase() == 'approved'
                                ? Palette.warmGoldenYellow
                                : Colors.orange.shade700,
                      ),
                    ),

                    // Action buttons
                    Row(
                      children: [
                        _icon(icon: Icons.edit_outlined, onTap: () {}),
                        const SizedBox(width: 5),
                        _icon(
                          icon: Icons.visibility_outlined,
                          bgColor: Palette.accent500,
                          iconColor: Colors.white,
                          onTap:
                              () => Get.to(
                                () =>
                                    ProjectDetailsScreen(projectId: project.id),
                              ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
        ],
      ),
    );
  }

  Widget _icon({
    required IconData icon,
    VoidCallback? onTap,
    Color borderColor = const Color(0xFFBDBDBD),
    Color bgColor = Colors.white,
    Color iconColor = Colors.black87,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, size: 16, color: iconColor),
      ),
    );
  }
}
