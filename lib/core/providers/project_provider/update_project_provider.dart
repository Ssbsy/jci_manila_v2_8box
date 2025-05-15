import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jci_manila_v2/core/base_api/base_api.dart';
import 'package:jci_manila_v2/core/constants/project_form_controller.dart';
import 'package:jci_manila_v2/core/services/projects/update_project_services.dart';

class UpdateProjectProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final UpdateProjectServices _service = UpdateProjectServices(
    BaseApiServices(),
  );

  String chairmanName = '';
  String directorateName = '';

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> fetchChairmanNameById(String id) async {
    try {
      final response = await http.get(
        Uri.parse('${BaseApiServices().baseUrl}v2.2/users/$id'),
        headers: await BaseApiServices().getHeaders(),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        chairmanName = data['data']['name'] ?? 'Unknown';
      } else {
        chairmanName = 'Not found';
      }
    } catch (e) {
      chairmanName = 'Error';
    }
    notifyListeners();
  }

  Future<void> fetchDirectorateNameById(String id) async {
    try {
      final response = await http.get(
        Uri.parse('${BaseApiServices().baseUrl}v2.2/directorates/$id'),
        headers: await BaseApiServices().getHeaders(),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        directorateName = data['data']['name'] ?? 'Unknown';
      } else {
        directorateName = 'Not found';
      }
    } catch (e) {
      directorateName = 'Error';
    }
    notifyListeners();
  }

  Future<Map<String, dynamic>> updateProject(
    int projectId,
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

    if (controller.commissioner.text.trim().isNotEmpty) {
      payload["commissioner"] =
          int.tryParse(controller.commissioner.text.trim()) ?? 0;
    }

    try {
      final response = await _service.updateProject(
        projectId: projectId,
        title: payload["title"],
        description: payload["description"],
        startDate: payload["start_date"],
        endDate: payload["end_date"],
        overview: payload["overview"],
        objective: payload["objective"],
        chairman: payload["chairman"] ?? 0,
        directorates: payload["directorates"] ?? 0,
        committees: payload["committees"],
      );
      return response;
    } catch (e) {
      return {'success': false, 'message': e.toString()};
    } finally {
      setLoading(false);
    }
  }
}
