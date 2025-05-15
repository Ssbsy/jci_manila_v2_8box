// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/core/constants/project_form_controller.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/app/widgets/widget_text_field.dart';
import 'package:jci_manila_v2/core/providers/project_provider/update_project_provider.dart';
import 'package:jci_manila_v2/core/services/projects/project_by_id_services.dart';
import 'package:jci_manila_v2/core/base_api/base_api.dart';
import 'package:provider/provider.dart';

class UpdateProjectScreen extends StatefulWidget {
  final int projectId;
  const UpdateProjectScreen({super.key, required this.projectId});

  @override
  State<UpdateProjectScreen> createState() => _UpdateProjectScreenState();
}

class _UpdateProjectScreenState extends State<UpdateProjectScreen> {
  final _formKey = GlobalKey<FormState>();
  late final ProjectFormController formController;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    formController = ProjectFormController();
    fetchProjectDetails();
  }

  @override
  void dispose() {
    formController.disposeAll();
    super.dispose();
  }

  Future<void> fetchProjectDetails() async {
    final response = await ProjectByIdServices(
      BaseApiServices(),
    ).getProjectById(widget.projectId);
    if (response['success'] == true && response['data'] != null) {
      final data = response['data'];
      formController.title.text = data['project_title'] ?? '';
      formController.description.text = data['project_description'] ?? '';
      formController.startDate.text = data['project_start_date'] ?? '';
      formController.endDate.text = data['project_end_date'] ?? '';
      formController.overview.text = data['overview'] ?? '';
      formController.objective.text = data['objective'] ?? '';
      formController.chairman.text = data['chairman'].toString();
      formController.chairman.text = data['chairman']?.toString() ?? '';
      formController.directorates.text = data['directorates']?.toString() ?? '';
      setState(() => isLoading = false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(response['message'] ?? 'Failed to fetch project data'),
        ),
      );
    }
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

  Future<void> _handleUpdate() async {
    if (!_formKey.currentState!.validate()) return;

    final provider = Provider.of<UpdateProjectProvider>(context, listen: false);
    final response = await provider.updateProject(
      widget.projectId,
      formController,
    );

    if (!mounted) return;

    if (response['success'] == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Project updated successfully!')),
      );
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response['message'] ?? 'Update failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isSubmitting = context.watch<UpdateProjectProvider>().isLoading;

    return Scaffold(
      backgroundColor: Palette.neutralWhite,
      appBar: AppBar(
        title: const Text('Update Project'),
        backgroundColor: Palette.gradientStart,
        foregroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : Form(
                key: _formKey,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionHeader('Project Information'),
                      _buildFormField(
                        'Project Title',
                        'Edit Project Title',
                        formController.title,
                        isRequired: true,
                      ),
                      const Gap(12),
                      _buildFormField(
                        'Project Description',
                        'Edit Description',
                        formController.description,
                        maxLines: 3,
                        isRequired: true,
                      ),
                      const Gap(12),
                      _buildFormField(
                        'Start Date',
                        'Edit Start Date',
                        formController.startDate,
                        isDate: true,
                        isRequired: true,
                        onTap: () => _selectDate(formController.startDate),
                      ),
                      const Gap(12),
                      _buildFormField(
                        'End Date',
                        'Edit End Date',
                        formController.endDate,
                        isDate: true,
                        isRequired: true,
                        onTap: () => _selectDate(formController.endDate),
                      ),
                      const Gap(12),
                      _buildFormField(
                        'Overview',
                        'Edit Overview',
                        formController.overview,
                        maxLines: 3,
                        isRequired: true,
                      ),
                      const Gap(12),
                      _buildFormField(
                        'Objectives',
                        'Edit Objectives',
                        formController.objective,
                        maxLines: 3,
                        isRequired: true,
                      ),
                      const Gap(12),
                      _buildFormField(
                        'Chairman',
                        'Edit Chairman ID',
                        formController.chairman,
                        isRequired: true,
                      ),
                      const Gap(12),
                      _buildFormField(
                        'Directorates',
                        'Edit Directorate ID',
                        formController.directorates,
                        isRequired: true,
                      ),
                      const Gap(30),
                      _buildFormActions(isSubmitting),
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
              validator:
                  (value) =>
                      isRequired && (value == null || value.trim().isEmpty)
                          ? 'This field is required'
                          : null,
            ),
      ],
    );
  }

  Widget _buildFormActions(bool isLoading) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () => Navigator.of(context).pop(),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Palette.accentBlue),
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: Palette.accentBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const Gap(12),
        Expanded(
          child: ElevatedButton(
            onPressed: isLoading ? null : _handleUpdate,
            style: ElevatedButton.styleFrom(
              backgroundColor: Palette.accentBlue,
              foregroundColor: Palette.neutralWhite,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child:
                isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                      'Update',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
          ),
        ),
      ],
    );
  }
}
