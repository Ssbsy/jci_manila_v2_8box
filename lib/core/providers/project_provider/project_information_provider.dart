import 'package:flutter/material.dart';
import 'package:jci_manila_v2/core/base_api/base_api.dart';
import 'package:jci_manila_v2/core/services/projects/project_by_id_services.dart';

class ProjectInformationProvider extends ChangeNotifier {
  final ProjectByIdServices _service = ProjectByIdServices(BaseApiServices());

  Map<String, dynamic>? _project;
  bool _isLoading = false;

  Map<String, dynamic>? get project => _project;
  bool get isLoading => _isLoading;

  Future<void> fetchProject(int id) async {
    _isLoading = true;
    notifyListeners();

    final response = await _service.getProjectById(id);

    if (response['success'] == true && response['data'] != null) {
      _project = response['data'];
    }

    _isLoading = false;
    notifyListeners();
  }
}
