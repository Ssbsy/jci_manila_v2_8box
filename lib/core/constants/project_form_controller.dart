import 'package:flutter/material.dart';

class ProjectFormController {
  final title = TextEditingController();
  final description = TextEditingController();
  final startDate = TextEditingController();
  final endDate = TextEditingController();
  final overview = TextEditingController();
  final objective = TextEditingController();
  final chairman = TextEditingController();
  final commissioner = TextEditingController();
  final directorates = TextEditingController();
  final committeeName = TextEditingController();
  final committeeId = TextEditingController();
  final memberType = TextEditingController();

  void disposeAll() {
    title.dispose();
    description.dispose();
    startDate.dispose();
    endDate.dispose();
    overview.dispose();
    objective.dispose();
    chairman.dispose();
    commissioner.dispose();
    directorates.dispose();
    committeeName.dispose();
    committeeId.dispose();
    memberType.dispose();
  }
}
