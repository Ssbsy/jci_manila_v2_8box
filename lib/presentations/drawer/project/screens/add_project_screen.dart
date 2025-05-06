import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_button.dart';
import 'package:jci_manila_v2/app/widgets/widget_text_field.dart';
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

                    const Gap(10),

                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: WidgetButton(
                        text: 'Add Committee',
                        isBold: true,
                        onTap: () {},
                        textColor: Palette.primary,
                        borderColor: Palette.primary,
                        borderRadius: 12,
                        borderWidth: 1.5,
                        padding: 10,
                      ),
                    ),

                    const Gap(25),

                    _bottom(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _bottom(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        WidgetButton(
          text: 'Cancel',
          onTap: () => Get.offAllNamed('/projects'),
          containerWidth: MediaQuery.of(context).size.width * 0.43,
          borderRadius: 12,
          isBold: true,
          borderColor: Palette.primary,
          textColor: Palette.primary,
          padding: 10,
        ),
        WidgetButton(
          text: 'Save',
          onTap: () {},
          isBold: true,
          containerWidth: MediaQuery.of(context).size.width * 0.43,
          borderRadius: 12,
          borderColor: Palette.primary,
          containerColor: Palette.primary,
          textColor: Palette.white,
          padding: 10,
        ),
      ],
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
