import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/app/widgets/widget_text_field.dart';
import 'package:jci_manila_v2/core/base_api/base_api.dart';
import 'package:jci_manila_v2/core/services/projects/add_projects_services.dart';

class AddProjectScreen extends StatefulWidget {
  const AddProjectScreen({super.key});

  @override
  State<AddProjectScreen> createState() => _AddProjectScreenState();
}

class _AddProjectScreenState extends State<AddProjectScreen> {
  final _formKey = GlobalKey<FormState>();

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
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    startController.dispose();
    endController.dispose();
    overviewController.dispose();
    objectiveController.dispose();
    chairmanController.dispose();
    commissionerController.dispose();
    directoratesController.dispose();
    committeeNameController.dispose();
    committeeIDController.dispose();
    memberTypeController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(TextEditingController controller) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      controller.text = picked.toIso8601String().substring(0, 10);
    }
  }

  Future<void> _submitProject() async {
    if (!_formKey.currentState!.validate()) return;

    final payload = {
      "title": titleController.text,
      "description": descriptionController.text,
      "start_date": startController.text,
      "end_date": endController.text,
      "overview": overviewController.text,
      "objective": objectiveController.text,
      "chairman": int.tryParse(chairmanController.text) ?? 0,
      "directorates": int.tryParse(directoratesController.text) ?? 0,
      "committees": [
        {
          "member_id": int.tryParse(committeeIDController.text) ?? 0,
          "member_type": memberTypeController.text,
          "name": committeeNameController.text,
        },
      ],
    };

    // Optional commissioner
    if (commissionerController.text.trim().isNotEmpty) {
      payload["commissioner"] =
          int.tryParse(commissionerController.text.trim()) ?? 0;
    }

    final service = AddProjectService(BaseApiServices());
    final response = await service.postProject(payload);

    if (!mounted) return;

    if (response['success'] == true) {
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response['message'] ?? 'Something went wrong')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.neutralWhite,
      appBar: AppBar(
        title: const Text('Add Project'),
        backgroundColor: Palette.gradientStart,
        foregroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader('Project Information'),
              _buildFormField(
                'Project Title',
                'Add Project Title',
                titleController,
                isRequired: true,
              ),
              const Gap(12),
              _buildFormField(
                'Project Description',
                'Add Project Description',
                descriptionController,
                maxLines: 3,
                isRequired: true,
              ),
              const Gap(12),
              _buildFormField(
                'Start Date',
                'Add Start Date',
                startController,
                isDate: true,
                onTap: () => _selectDate(startController),
                isRequired: true,
              ),
              const Gap(12),
              _buildFormField(
                'End Date',
                'Add End Date',
                endController,
                isDate: true,
                onTap: () => _selectDate(endController),
                isRequired: true,
              ),
              const Gap(12),
              _buildFormField(
                'Overview/Background',
                'Add Overview',
                overviewController,
                maxLines: 3,
                isRequired: true,
              ),
              const Gap(12),
              _buildFormField(
                'Objectives',
                'Add Objectives',
                objectiveController,
                maxLines: 3,
                isRequired: true,
              ),
              const Gap(12),
              _buildFormField(
                'Chairman',
                'Add Chairman ID',
                chairmanController,
                isRequired: true,
              ),
              const Gap(12),
              _buildFormField(
                'Commissioner',
                'Auto-filled in backend',
                commissionerController,
              ),
              const Gap(12),
              _buildFormField(
                'Directorates',
                'Add Directorate ID',
                directoratesController,
                isRequired: true,
              ),
              const Gap(24),
              _buildSectionHeader('Committee Members'),
              _buildFormField(
                'Committee Name',
                'Add Committee Name',
                committeeNameController,
                isRequired: true,
              ),
              const Gap(12),
              _buildFormField(
                'Committee ID',
                'Add Committee ID',
                committeeIDController,
                isRequired: true,
              ),
              const Gap(12),
              _buildFormField(
                'Member Type',
                'Add Member Type',
                memberTypeController,
                isRequired: true,
              ),
              const Gap(16),
              _buildOutlineButton('Add Committee'),
              const Gap(30),
              _buildFormActions(),
              const Gap(30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetText(title: title, isBold: true, size: 16),
        const Gap(12),
      ],
    );
  }

  Widget _buildFormField(
    String label,
    String hint,
    TextEditingController controller, {
    int maxLines = 1,
    bool isDate = false,
    bool isRequired = false,
    VoidCallback? onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetText(title: label, isBold: false, size: 14),
        const Gap(6),
        isDate
            ? GestureDetector(
              onTap: onTap,
              child: AbsorbPointer(
                child: WidgetTextField(
                  controller: controller,
                  hintText: hint,
                  fillColor: Palette.neutralWhite,
                  isFilled: true,
                  maxLines: maxLines,
                  suffixIcon: const Icon(
                    Icons.calendar_month,
                    color: Palette.accentBlue,
                  ),
                  enabledBorderSideColor: Palette.neutralLightGray,
                  focusedBorderSideColor: Palette.neutralLightGray,
                  textColor: Palette.neutralBlack,
                ),
              ),
            )
            : TextFormField(
              controller: controller,
              maxLines: maxLines,
              decoration: InputDecoration(
                filled: true,
                fillColor: Palette.neutralWhite,
                hintText: hint,
                hintStyle: const TextStyle(color: Palette.neutralGray),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Palette.neutralLightGray),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Palette.neutralLightGray),
                ),
              ),
              style: const TextStyle(color: Palette.neutralBlack),
              validator: (value) {
                if (isRequired && (value == null || value.trim().isEmpty)) {
                  return 'This field is required';
                }
                return null;
              },
            ),
      ],
    );
  }

  Widget _buildOutlineButton(String text) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Palette.accentBlue),
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Palette.accentBlue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildFormActions() {
    return Row(
      children: [
        Expanded(child: _buildOutlineButton('Cancel')),
        const Gap(12),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Palette.accentBlue,
              foregroundColor: Palette.neutralWhite,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: _submitProject,
            child: const Text(
              'Save',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
