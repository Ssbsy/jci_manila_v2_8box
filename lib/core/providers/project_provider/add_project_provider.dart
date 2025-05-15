import 'package:flutter/material.dart';
import 'package:jci_manila_v2/core/base_api/base_api.dart';
import 'package:jci_manila_v2/core/constants/project_form_controller.dart';
import 'package:jci_manila_v2/core/services/projects/add_project_services.dart';

class AddProjectProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final AddProjectService _service = AddProjectService(BaseApiServices());

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<Map<String, dynamic>> submitProject(
    ProjectFormController controller,
  ) async {
    if (_isLoading) return {'success': false, 'message': 'Already submitting'};

    setLoading(true);

    final payload = {
      "title": controller.title.text,
      "description": controller.description.text,
      "start_date": controller.startDate.text,
      "end_date": controller.endDate.text,
      "overview": controller.overview.text,
      "objective": controller.objective.text,
      "chairman": int.tryParse(controller.chairman.text) ?? 0,
      "directorates": int.tryParse(controller.directorates.text) ?? 0,
      "committees": [
        {
          "member_id": int.tryParse(controller.committeeId.text) ?? 0,
          "member_type": controller.memberType.text,
          "name": controller.committeeName.text,
        },
      ],
    };

    if (controller.commissioner.text.trim().isNotEmpty) {
      payload["commissioner"] =
          int.tryParse(controller.commissioner.text.trim()) ?? 0;
    }

    final response = await _service.postProject(payload);
    setLoading(false);
    return response;
  }
}
