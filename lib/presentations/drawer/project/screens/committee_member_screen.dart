// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/core/providers/project_provider/committee_member_provider.dart';
import 'package:provider/provider.dart';

class CommitteeMemberScreen extends StatefulWidget {
  final int projectId;

  const CommitteeMemberScreen({super.key, required this.projectId});

  @override
  State<CommitteeMemberScreen> createState() => _CommitteeMemberScreenState();
}

class _CommitteeMemberScreenState extends State<CommitteeMemberScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<CommitteeMemberProvider>().fetchCommittees(
        widget.projectId,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CommitteeMemberProvider>();

    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (provider.committees.isEmpty) {
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
            _col(
              'ID',
              provider.committees.map((c) => c['id'].toString()).toList(),
            ),
            const SizedBox(width: 15),
            _col(
              'Committee Name',
              provider.committees
                  .map((c) => (c['name'] ?? '').toString())
                  .toList(),
            ),
            const SizedBox(width: 15),
            _col(
              'Member Type',
              provider.committees
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
