import 'package:flutter/material.dart';
import 'package:jci_manila_v2/core/base_api/base_api.dart';
import 'package:jci_manila_v2/core/constants/project_form_controller.dart';
import 'package:jci_manila_v2/core/services/projects/add_project_services.dart';
import 'dart:developer';

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

    final Map<String, dynamic> payload = {
      "title": controller.title.text.trim(),
      "description": controller.description.text.trim(),
      "start_date": controller.startDate.text.trim(),
      "end_date": controller.endDate.text.trim(),
      "overview": controller.overview.text.trim(),
      "objective": controller.objective.text.trim(),
    };

    if (controller.chairman.text.trim().isNotEmpty) {
      payload["chairman"] = int.tryParse(controller.chairman.text.trim()) ?? 0;
    }

    if (controller.directorates.text.trim().isNotEmpty) {
      payload["directorates"] =
          int.tryParse(controller.directorates.text.trim()) ?? 0;
    }

    if (controller.committeeId.text.trim().isNotEmpty ||
        controller.memberType.text.trim().isNotEmpty ||
        controller.committeeName.text.trim().isNotEmpty) {
      payload["committees"] = [
        {
          "member_id": int.tryParse(controller.committeeId.text.trim()) ?? 0,
          "member_type": controller.memberType.text.trim(),
          "name": controller.committeeName.text.trim(),
        },
      ];
    }

    if (controller.chairman.text.trim().isNotEmpty) {
      payload["chairman"] = int.tryParse(controller.chairman.text.trim()) ?? 0;
    }

    if (controller.directorates.text.trim().isNotEmpty) {
      payload["directorates"] =
          int.tryParse(controller.directorates.text.trim()) ?? 0;
    }

    if (controller.commissioner.text.trim().isNotEmpty) {
      payload["commissioner"] =
          int.tryParse(controller.commissioner.text.trim()) ?? 0;
    }

    if (controller.committeeId.text.trim().isNotEmpty ||
        controller.memberType.text.trim().isNotEmpty ||
        controller.committeeName.text.trim().isNotEmpty) {
      payload["committees"] = [
        {
          "member_id": int.tryParse(controller.committeeId.text.trim()) ?? 0,
          "member_type": controller.memberType.text.trim(),
          "name": controller.committeeName.text.trim(),
        },
      ];
    }

    log("Submitting Project Payload: ${payload.toString()}");

    final response = await _service.postProject(payload);
    setLoading(false);
    return response;
  }
}
