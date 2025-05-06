import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/app/components/widget_text_field.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';

class AddBusinessForm extends StatelessWidget {
  const AddBusinessForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.neutralWhite,
      appBar: AppBar(
        title: const Text('Add Business Form'),
        backgroundColor: Palette.gradientStart,
        foregroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader('Business Information'),
            _buildFormField('Store Type', 'Select your store type'),
            const Gap(12),

            _buildSectionSubHeader('Company Logo'),
            _buildFilePickerButton('Choose file'),
            const Gap(12),

            _buildFormField('Business Name', "Enter your business' name"),
            const Gap(12),

            _buildFormField(
              'Business Description',
              'Enter your business description',
              maxLines: 3,
            ),
            const Gap(12),

            _buildFormField('Main Products', 'Enter your main products'),
            const Gap(12),

            _buildReadOnlyField('JCIM Owner', '(You) Jan Adrian D. Padiernos'),
            const Gap(12),

            _buildFormField('JCIM Co-Owner', "Enter your Co-Owner's name"),
            const Gap(6),
            _buildOutlineButton('Add Co-Owner'),
            const Gap(12),

            _buildFormField('Industry', 'Select your industry'),

            // Business Contact Details Section
            _buildSectionHeader('Business Contact Details', topMargin: 24),
            _buildFormField('Website', 'Enter your website link'),
            const Gap(12),

            _buildFormField('Company Email', 'Enter your company email'),
            const Gap(12),

            _buildFormField(
              'Primary Contact Number',
              'Enter your active contact number',
            ),
            const Gap(12),

            _buildFormField(
              'Secondary Contact Number',
              'Enter your active contact number',
            ),

            // JCI Member Benefits Section
            _buildSectionHeader('JCI Member Benefits', topMargin: 24),
            _buildFormField(
              'Benefits',
              'Enter your benefits for the members',
              maxLines: 2,
            ),
            const Gap(12),

            _buildFormField('Tags', 'Enter common tags'),

            // Business Location Section
            _buildSectionHeader('Business Location', topMargin: 24),
            _buildFormField('Address', 'Enter your business address'),
            const Gap(12),

            _buildOutlineButton('Pin Location'),

            // Social Media Links Section
            _buildSectionHeader('Social Media Links', topMargin: 24),
            _buildFormField('Facebook', "Enter your business' Facebook link"),
            const Gap(12),

            _buildFormField('Instagram', "Enter your business' Instagram link"),
            const Gap(12),

            _buildFormField(
              'X (Formerly Twitter)',
              "Enter your business' X link",
            ),

            // Form Actions
            _buildFormActions(),
            const Gap(40),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, {double topMargin = 0}) {
    return Column(
      children: [
        if (topMargin > 0) Gap(topMargin),
        WidgetText(title: title, isBold: true, size: 16),
        const Gap(12),
      ],
    );
  }

  Widget _buildSectionSubHeader(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetText(title: title, isBold: false, size: 14),
        const Gap(6),
      ],
    );
  }

  Widget _buildFormField(String label, String hint, {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionSubHeader(label),
        WidgetTextField(
          controller: TextEditingController(),
          hintText: hint,
          fillColor: Palette.neutralWhite,
          isFilled: true,
          maxLines: maxLines,
          enabledBorderSideColor: Palette.neutralLightGray,
          focusedBorderSideColor: Palette.neutralLightGray,
          textColor: Palette.neutralBlack,
        ),
      ],
    );
  }

  Widget _buildReadOnlyField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionSubHeader(label),
        WidgetTextField(
          controller: TextEditingController(text: value),
          // ignore: deprecated_member_use
          fillColor: Palette.neutralGray.withOpacity(0.15),
          isFilled: true,
          enabledBorderSideColor: Colors.transparent,
          textColor: Colors.black87,
        ),
      ],
    );
  }

  Widget _buildFilePickerButton(String text) {
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
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Row(
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
              onPressed: () {},
              child: const Text(
                'Submit',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
