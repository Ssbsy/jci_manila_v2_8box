import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/app/components/widget_text_field.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';

class AddEventForm extends StatefulWidget {
  const AddEventForm({super.key});

  @override
  State<AddEventForm> createState() => _AddEventFormState();
}

class _AddEventFormState extends State<AddEventForm> {
  String? selectedEventType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.neutralWhite,
      appBar: AppBar(
        title: const Text('Add Event'),
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
            _buildSectionHeader('Event Information'),
            _buildDropdownField(
              'Event Type',
              'Select the event type',
              ['Conference', 'Seminar', 'Workshop', 'Social'],
              selectedEventType,
              (val) => setState(() => selectedEventType = val),
            ),
            const Gap(12),
            _buildTextField('Event Title', 'Enter your event title'),
            const Gap(12),
            _buildTextField(
              'Event Description',
              'Enter your event description',
              maxLines: 3,
            ),
            const Gap(12),
            _buildTextField(
              'Event Date',
              'Select the date of event',
              icon: Icons.calendar_today,
            ),
            const Gap(12),
            _buildTextField(
              'Event Time',
              'Select the time of event',
              icon: Icons.access_time,
            ),
            const Gap(12),
            _buildTextField(
              'Registration Start Date',
              'Select the start date of registration',
              icon: Icons.calendar_today,
            ),
            const Gap(12),
            _buildTextField(
              'Registration Start Time',
              'Select the start time of registration',
              icon: Icons.access_time,
            ),
            const Gap(12),
            _buildTextField(
              'Registration End Date',
              'Select the end date of registration',
              icon: Icons.calendar_today,
            ),
            const Gap(12),
            _buildTextField(
              'Registration End Time',
              'Select the end time of registration',
              icon: Icons.access_time,
            ),

            _buildSectionHeader('Onsite/In-Person Settings', topMargin: 24),
            _buildCheckboxField('Onsite/In-Person'),
            const Gap(12),
            _buildTextField('Onsite Fee', 'Enter your onsite fee'),

            _buildSectionHeader('GMM Section', topMargin: 24),
            _buildCheckboxField('Allow Free GMM'),
            const Gap(12),
            _buildTextField('Online Free GMM Cost', 'Enter your GMM cost'),
            const Gap(12),
            _buildTextField('Chairman', 'Select the chairman for event'),

            _buildSectionHeader('Committee Members', topMargin: 24),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Palette.lightSkyBlue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  _buildTextField(
                    'Committee name',
                    "Enter the committee's name",
                  ),
                  const Gap(12),
                  _buildTextField('Committee ID', "Enter the committee's ID"),
                  const Gap(12),
                  _buildTextField('Member Type', "Select the member's type"),
                ],
              ),
            ),
            const Gap(12),
            _buildOutlineButton('Add Committee'),
            const Gap(24),
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

  Widget _buildTextField(
    String label,
    String hint, {
    int maxLines = 1,
    IconData? icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetText(title: label, size: 14, isBold: false),
        const Gap(6),
        WidgetTextField(
          controller: TextEditingController(),
          hintText: hint,
          fillColor: Palette.neutralWhite,
          isFilled: true,
          maxLines: maxLines,
          enabledBorderSideColor: Palette.neutralLightGray,
          focusedBorderSideColor: Palette.neutralLightGray,
          textColor: Palette.neutralBlack,
          suffixIcon:
              icon != null ? Icon(icon, color: Palette.accentBlue) : null,
        ),
      ],
    );
  }

  Widget _buildDropdownField(
    String label,
    String hint,
    List<String> items,
    String? selectedValue,
    ValueChanged<String?> onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetText(title: label, size: 14, isBold: false),
        const Gap(6),
        DropdownButtonFormField<String>(
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Palette.neutralBlack,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Palette.neutralGray,
            ),
            filled: true,
            fillColor: Palette.neutralWhite,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 14,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Palette.neutralLightGray, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Palette.neutralLightGray,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          value: selectedValue,
          items:
              items
                  .map(
                    (item) => DropdownMenuItem(
                      value: item,
                      child: Text(item, style: const TextStyle(fontSize: 14)),
                    ),
                  )
                  .toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildCheckboxField(String label) {
    return Row(
      children: [
        Checkbox(value: false, onChanged: (val) {}),
        WidgetText(title: label, size: 14),
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
            onPressed: () {},
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
