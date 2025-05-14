import 'package:flutter/material.dart';

class ProjectFormController {
  static final title = TextEditingController();
  static final description = TextEditingController();
  static final startDate = TextEditingController();
  static final endDate = TextEditingController();
  static final overview = TextEditingController();
  static final objective = TextEditingController();
  static final chairman = TextEditingController();
  static final commissioner = TextEditingController();
  static final directorates = TextEditingController();
  static final committeeName = TextEditingController();
  static final committeeId = TextEditingController();
  static final memberType = TextEditingController();

  static void disposeAll() {
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
