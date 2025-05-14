import 'package:flutter/material.dart';
import 'package:jci_manila_v2/core/base_api/base_api.dart';
import 'package:jci_manila_v2/core/services/projects/project_by_id_services.dart';

class CommitteeMemberProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _committees = [];
  bool _isLoading = true;

  List<Map<String, dynamic>> get committees => _committees;
  bool get isLoading => _isLoading;

  Future<void> fetchCommittees(int projectId) async {
    _isLoading = true;
    notifyListeners();

    final response = await ProjectByIdServices(
      BaseApiServices(),
    ).getProjectById(projectId);
    if (response['success'] == true &&
        response['data'] != null &&
        response['data']['committees'] != null) {
      _committees.clear();
      for (final c in response['data']['committees']) {
        _committees.add(Map<String, dynamic>.from(c));
      }
    }

    _isLoading = false;
    notifyListeners();
  }
}
