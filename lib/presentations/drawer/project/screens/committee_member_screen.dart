import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/core/base_api/base_api.dart';
import 'package:jci_manila_v2/core/services/projects/project_by_id_services.dart';

class CommitteeMemberScreen extends StatefulWidget {
  final int projectId;

  const CommitteeMemberScreen({super.key, required this.projectId});

  @override
  State<CommitteeMemberScreen> createState() => _CommitteeMemberScreenState();
}

class _CommitteeMemberScreenState extends State<CommitteeMemberScreen> {
  List<dynamic> committees = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCommitteeMembers();
  }

  Future<void> fetchCommitteeMembers() async {
    final response = await ProjectByIdServices(
      BaseApiServices(),
    ).getProjectById(widget.projectId);

    if (!mounted) return;
    if (response['success'] == true &&
        response['data'] != null &&
        response['data']['committees'] != null) {
      setState(() {
        committees = response['data']['committees'];
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

    if (committees.isEmpty) {
      return const Center(
        child: WidgetText(title: "No committee members found."),
      );
    }

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _col('ID', committees.map((c) => c['id'].toString()).toList()),
            const SizedBox(width: 15),
            _col(
              'Committee Name',
              committees.map((c) => (c['name'] ?? '').toString()).toList(),
            ),
            const SizedBox(width: 15),
            _col(
              'Member Type',
              committees
                  .map((c) => (c['member_type'] ?? '').toString())
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _col(String title, List<String> contents) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetText(title: title, isBold: true, size: 16),
        const SizedBox(height: 10),
        ...contents.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: WidgetText(title: item, size: 14),
          ),
        ),
      ],
    );
  }
}
