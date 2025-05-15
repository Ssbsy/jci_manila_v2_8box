import 'package:flutter/material.dart';
import 'package:jci_manila_v2/core/base_api/base_api.dart';
import 'package:jci_manila_v2/core/models/project.dart';
import 'package:jci_manila_v2/core/services/projects/my_projects_services.dart';

class GetMyProjectsProvider extends ChangeNotifier {
  final MyProjectsServices _service = MyProjectsServices(BaseApiServices());
  List<ProjectModel> _projects = [];
  bool _isLoading = false;

  List<ProjectModel> get projects => _projects;
  bool get isLoading => _isLoading;

  Future<void> fetchProjects() async {
    _isLoading = true;
    notifyListeners();

    final response = await _service.getMyProjects();

    if (response['success'] == true && response['data'] != null) {
      final List data = response['data'];
      _projects = data.map((e) => ProjectModel.fromJson(e)).toList();
    }

    _isLoading = false;
    notifyListeners();
  }
}
