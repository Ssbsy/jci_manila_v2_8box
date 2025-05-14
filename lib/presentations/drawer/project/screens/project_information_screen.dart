import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/core/base_api/base_api.dart';
import 'package:jci_manila_v2/core/services/projects/project_by_id_services.dart';

class ProjectInformationScreen extends StatefulWidget {
  final int projectId;

  const ProjectInformationScreen({super.key, required this.projectId});

  @override
  State<ProjectInformationScreen> createState() =>
      _ProjectInformationScreenState();
}

class _ProjectInformationScreenState extends State<ProjectInformationScreen> {
  Map<String, dynamic>? project;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadProject();
  }

  Future<void> loadProject() async {
    final response = await ProjectByIdServices(
      BaseApiServices(),
    ).getProjectById(widget.projectId);

    if (!mounted) return;

    if (response['success'] == true && response['data'] != null) {
      setState(() {
        project = response['data'];
        isLoading = false;
      });
    } else {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (project == null) {
      return const Center(child: WidgetText(title: "Project not found."));
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: Column(
        spacing: 15,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _items('Project Title', project?['project_title'] ?? 'N/A'),
          _items(
            'Project Description',
            project?['project_description'] ?? 'N/A',
          ),
          _items('Project Start', project?['project_start_date'] ?? 'N/A'),
          _items('Project End', project?['project_end_date'] ?? 'N/A'),
          _items('Overview/Background', project?['overview'] ?? 'N/A'),
          _items('Objectives', project?['objective'] ?? 'N/A'),
          _items('Chairman', project?['chairman'] ?? 'N/A'),
          _items('Commissioner', project?['commissioner'] ?? 'N/A'),
          _items('Directorates', project?['directorates'] ?? 'N/A'),
          _items('BOD Status', project?['status'] ?? 'N/A'),
        ],
      ),
    );
  }

  Column _items(String title, String subTitle, {bool isBold = true}) {
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetText(title: title, isBold: isBold, size: 14),
        WidgetText(title: subTitle, maxLine: 50, isJustified: true),
        const SizedBox(height: 10),
      ],
    );
  }
}
