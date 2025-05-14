import 'package:flutter/material.dart';
import 'package:jci_manila_v2/core/base_api/base_api.dart';
import 'package:jci_manila_v2/core/constants/project_form_controller.dart';
import 'package:jci_manila_v2/core/services/projects/add_projects_services.dart';

class AddProjectProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final AddProjectService _service = AddProjectService(BaseApiServices());

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<Map<String, dynamic>> submitProject() async {
    if (_isLoading) return {'success': false, 'message': 'Already submitting'};

    setLoading(true);

    final payload = {
      "title": ProjectFormController.title.text,
      "description": ProjectFormController.description.text,
      "start_date": ProjectFormController.startDate.text,
      "end_date": ProjectFormController.endDate.text,
      "overview": ProjectFormController.overview.text,
      "objective": ProjectFormController.objective.text,
      "chairman": int.tryParse(ProjectFormController.chairman.text) ?? 0,
      "directorates":
          int.tryParse(ProjectFormController.directorates.text) ?? 0,
      "committees": [
        {
          "member_id":
              int.tryParse(ProjectFormController.committeeId.text) ?? 0,
          "member_type": ProjectFormController.memberType.text,
          "name": ProjectFormController.committeeName.text,
        },
      ],
    };

    if (ProjectFormController.commissioner.text.trim().isNotEmpty) {
      payload["commissioner"] =
          int.tryParse(ProjectFormController.commissioner.text.trim()) ?? 0;
    }

    final response = await _service.postProject(payload);
    setLoading(false);
    return response;
  }
}
