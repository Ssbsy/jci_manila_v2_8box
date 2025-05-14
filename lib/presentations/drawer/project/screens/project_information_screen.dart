import 'package:flutter/material.dart';
import 'package:jci_manila_v2/core/providers/project_provider/project_information_provider.dart';
import 'package:provider/provider.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';

class ProjectInformationScreen extends StatefulWidget {
  final int projectId;

  const ProjectInformationScreen({super.key, required this.projectId});

  @override
  State<ProjectInformationScreen> createState() =>
      _ProjectInformationScreenState();
}

class _ProjectInformationScreenState extends State<ProjectInformationScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      // ignore: use_build_context_synchronously
      context.read<ProjectInformationProvider>().fetchProject(widget.projectId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProjectInformationProvider>(
      builder: (context, provider, _) {
        if (provider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final project = provider.project;

        if (project == null) {
          return const Center(child: WidgetText(title: "Project not found."));
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _items('Project Title', project['project_title'] ?? 'N/A'),
              _items(
                'Project Description',
                project['project_description'] ?? 'N/A',
              ),
              _items('Project Start', project['project_start_date'] ?? 'N/A'),
              _items('Project End', project['project_end_date'] ?? 'N/A'),
              _items('Overview/Background', project['overview'] ?? 'N/A'),
              _items('Objectives', project['objective'] ?? 'N/A'),
              _items('Chairman', project['chairman'] ?? 'N/A'),
              _items('Commissioner', project['commissioner'] ?? 'N/A'),
              _items('Directorates', project['directorates'] ?? 'N/A'),
              _items('BOD Status', project['status'] ?? 'N/A'),
            ],
          ),
        );
      },
    );
  }

  Widget _items(String title, String subTitle, {bool isBold = true}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WidgetText(title: title, isBold: isBold, size: 14),
          WidgetText(title: subTitle, maxLine: 50, isJustified: true),
        ],
      ),
    );
  }
}
