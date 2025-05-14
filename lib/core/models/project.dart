class ProjectModel {
  final int id;
  final String projectTitle;
  final String status;

  ProjectModel({
    required this.id,
    required this.projectTitle,
    required this.status,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'] ?? 0,
      projectTitle: json['project_title'] ?? '',
      status: json['status'] ?? '',
    );
  }
}
