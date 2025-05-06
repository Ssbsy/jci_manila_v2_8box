import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/app/components/widget_text_field.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/presentations/drawer/project/components/project_appbar.dart';

class AddProjectScreen extends StatefulWidget {
  const AddProjectScreen({super.key});

  @override
  State<AddProjectScreen> createState() => _AddProjectScreenState();
}

class _AddProjectScreenState extends State<AddProjectScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final startController = TextEditingController();
  final endController = TextEditingController();
  final overviewController = TextEditingController();
  final objectiveController = TextEditingController();
  final chairmanController = TextEditingController();
  final commissionerController = TextEditingController();
  final directoratesController = TextEditingController();
  final committeeNameController = TextEditingController();
  final committeeIDController = TextEditingController();
  final memberTypeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProjectAppbar(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WidgetText(
                      title: 'Project Information',
                      isBold: true,
                      size: 18,
                    ),
                    _textfield(
                      'Project Title',
                      titleController,
                      'Enter your project title',
                    ),
                    _textfield(
                      'Project Description',
                      descriptionController,
                      'Enter your project Description',
                    ),
                    _textfield(
                      'Start Date',
                      startController,
                      'Select the start date',
                      isSufix: true,
                    ),
                    _textfield(
                      'End Date',
                      endController,
                      'Select the end date',
                      isSufix: true,
                    ),
                    _textfield(
                      'Overview/Background',
                      overviewController,
                      'Enter an overview or brief background',
                    ),
                    _textfield(
                      'Objectives',
                      objectiveController,
                      'Enter the project objectives',
                    ),
                    _textfield(
                      'Chairman',
                      chairmanController,
                      'Select the chairman of the project',
                    ),
                    _textfield(
                      'Commissioner',
                      commissionerController,
                      'Select the commissioner of the project',
                    ),
                    _textfield(
                      'Directorates',
                      directoratesController,
                      'Select the directorates of the project',
                    ),
                    WidgetText(
                      title: 'Committee members',
                      isBold: true,
                      size: 18,
                    ),
                    _textfield(
                      'Committee name',
                      committeeNameController,
                      "Enter the Committee's name",
                    ),
                    _textfield(
                      'Committee ID',
                      committeeIDController,
                      "Enter the Committee's ID",
                    ),
                    _textfield(
                      'Member Type',
                      memberTypeController,
                      "Enter the members's Type",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textfield(
    String header,
    TextEditingController controller,
    String hint, {
    bool isSufix = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
      child: Column(
        spacing: 5,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WidgetText(title: header, size: 14),
          WidgetTextField(
            controller: controller,
            hintText: hint,
            suffixIcon: isSufix ? Icon(Icons.calendar_month) : null,
          ),
        ],
      ),
    );
  }
}
