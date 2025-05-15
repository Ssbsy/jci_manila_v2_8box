import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/core/constants/project_form_controller.dart';
import 'package:jci_manila_v2/core/providers/project_provider/add_project_provider.dart';
import 'package:provider/provider.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/app/widgets/widget_text_field.dart';

class AddProjectScreen extends StatefulWidget {
  const AddProjectScreen({super.key});

  @override
  State<AddProjectScreen> createState() => _AddProjectScreenState();
}

class _AddProjectScreenState extends State<AddProjectScreen> {
  final _formKey = GlobalKey<FormState>();
  late final ProjectFormController formController;

  @override
  void initState() {
    super.initState();
    formController = ProjectFormController();
  }

  @override
  void dispose() {
    formController.disposeAll();
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

  Future<void> _handleSubmit(BuildContext context) async {
    if (!_formKey.currentState!.validate()) return;

    final provider = Provider.of<AddProjectProvider>(context, listen: false);
    final response = await provider.submitProject(formController);

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
    final isLoading = context.watch<AddProjectProvider>().isLoading;

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
                formController.title,
                isRequired: true,
              ),
              const Gap(12),
              _buildFormField(
                'Project Description',
                'Add Project Description',
                formController.description,
                maxLines: 3,
                isRequired: true,
              ),
              const Gap(12),
              _buildFormField(
                'Start Date',
                'Add Start Date',
                formController.startDate,
                isDate: true,
                isRequired: true,
                onTap: () => _selectDate(formController.startDate),
              ),
              const Gap(12),
              _buildFormField(
                'End Date',
                'Add End Date',
                formController.endDate,
                isDate: true,
                isRequired: true,
                onTap: () => _selectDate(formController.endDate),
              ),
              const Gap(12),
              _buildFormField(
                'Overview/Background',
                'Add Overview',
                formController.overview,
                maxLines: 3,
                isRequired: true,
              ),
              const Gap(12),
              _buildFormField(
                'Objectives',
                'Add Objectives',
                formController.objective,
                maxLines: 3,
                isRequired: true,
              ),
              const Gap(12),
              _buildFormField(
                'Chairman',
                'Add Chairman ID',
                formController.chairman,
                isRequired: true,
              ),
              const Gap(12),
              // Commissioner field removed since it is auto-filled by backend
              _buildFormField(
                'Directorates',
                'Add Directorate ID',
                formController.directorates,
                isRequired: true,
              ),
              const Gap(24),
              _buildSectionHeader('Committee Members'),
              _buildFormField(
                'Committee Name',
                'Add Committee Name',
                formController.committeeName,
                isRequired: true,
              ),
              const Gap(12),
              _buildFormField(
                'Committee ID',
                'Add Committee ID',
                formController.committeeId,
                isRequired: true,
              ),
              const Gap(12),
              _buildFormField(
                'Member Type',
                'Add Member Type',
                formController.memberType,
                isRequired: true,
              ),
              const Gap(16),
              _buildOutlineButton('Add Committee'),
              const Gap(30),
              _buildFormActions(isLoading),
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

  Widget _buildFormActions(bool isLoading) {
    return Row(
      children: [
        Expanded(child: _buildOutlineButton('Cancel')),
        const Gap(12),
        Expanded(
          child: ElevatedButton(
            onPressed: isLoading ? null : () => _handleSubmit(context),
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
                      'Save',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
          ),
        ),
      ],
    );
  }
}
