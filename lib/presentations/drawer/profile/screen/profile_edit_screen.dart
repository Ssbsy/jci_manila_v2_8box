import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_button.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/app/widgets/widget_text_field.dart';
import 'package:jci_manila_v2/core/constants/images.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Palette.veryDarkBluishGray,
        appBar: AppBar(
          backgroundColor: Palette.transparent,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back_ios, color: Palette.white),
          ),
          title: WidgetText(
            title: 'Edit Profile',
            color: Palette.white,
            size: 18,
            isBold: true,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 80, height: 80, child: Images.profile_photo_01),
            const Gap(10),
            WidgetButton(
              text: 'Upload Photo',
              onTap: () {},
              containerWidth: MediaQuery.of(context).size.width * 0.35,
              containerColor: Palette.primary,
              borderColor: Palette.primary,
              textColor: Palette.white,
              borderRadius: 12,
              padding: 10,
              isBold: true,
            ),
            const Gap(30),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(15),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Palette.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _basicInfo(),
                      const Gap(10),
                      _contactInfo(),
                      const Gap(10),
                      _educationalAttainment(),
                      const Gap(10),
                      _personalInfo(),
                      const Gap(10),
                      _resume(),
                      const Gap(10),
                      _emailInfo(),
                      const Gap(10),
                      _hobbies(),
                      const Gap(10),
                      _journey(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _basicInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: WidgetText(title: 'Basic Information', isBold: true, size: 16),
        ),
        _textfield(
          'About yourself',
          controller,
          "Enter a short information about you",
        ),
        _textfield('First Name', controller, "Enter your first name"),
        _textfield('Last Name', controller, "Enter your last name"),
        _textfield('Middle Name', controller, "Enter your middle name"),
        _textfield('Nickname', controller, "Enter your nickname"),
        _textfield(
          'Birthday',
          controller,
          "Select your date of birth",
          isSufix: true,
        ),
      ],
    );
  }

  Column _contactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: WidgetText(
            title: 'Contact Information',
            isBold: true,
            size: 16,
          ),
        ),
        _textfield(
          'Home Address',
          controller,
          "Enter a short information about you",
        ),
        _textfield('Home City', controller, "Enter your first name"),
        _textfield('Spouse Name', controller, "Enter your middle name"),
        _textfield('Spouse Address', controller, "Enter your nickname"),
        _textfield('Shipping Address', controller, "Select your date of birth"),
        _textfield('Shipping City', controller, "Select your date of birth"),
        _textfield('Shipping Zip', controller, "Select your date of birth"),
      ],
    );
  }

  Column _educationalAttainment() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: WidgetText(
            title: 'Educational Attainment',
            isBold: true,
            size: 16,
          ),
        ),
        _textfield(
          'Educational Attainment',
          controller,
          "Enter your highest educational attainment",
        ),
        _textfield('Highschool', controller, "Enter your highschool"),
        _textfield('School graduated', controller, "Enter your school"),
        _textfield('Course', controller, "Enter your course"),
      ],
    );
  }

  Column _personalInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: WidgetText(
            title: 'Personal Information',
            isBold: true,
            size: 16,
          ),
        ),
        _textfield('Profession', controller, "Enter your profession"),
        _textfield(
          'Employement Status',
          controller,
          "Enter your current employement Status",
        ),
        _textfield('Company', controller, "Enter your company"),
        _textfield('Course', controller, "Enter your course"),
        _textfield('Industry', controller, "Enter your industry"),
        _textfield('Office Address', controller, "Enter your office Address"),
        _textfield('Office City', controller, "Enter your office city"),
        _textfield('Sponsor Name', controller, "Enter your sponsor Name"),
        _textfield(
          'Sponsor ID',
          controller,
          "Automatically retrieved",
          isfilled: true,
        ),
      ],
    );
  }

  Column _journey() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: WidgetText(title: 'Journey', isBold: true, size: 16),
        ),
        _textfield(
          'Current Position',
          controller,
          "Enter your current position",
        ),
        _textfield(
          'Current Directories Position',
          controller,
          "Enter your current directories position",
        ),
        _textfield(
          'Awards Received',
          controller,
          "Enter your awards you received",
        ),
        _textfield(
          'Board of Directors',
          controller,
          "Enter The board of Directors",
        ),
        _textfield(
          'Commissionership',
          controller,
          "Enter your commissionership",
        ),
        _textfield('Chairmanship', controller, "Enter your Chairmanship"),
        _textfield('Projects', controller, "Enter your projects"),
      ],
    );
  }

  Column _hobbies() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: WidgetText(title: 'Hobbies', isBold: true, size: 16),
        ),
        _textfield('Sports', controller, "Enter your sports"),
        _textfield('Interest', controller, "Enter your interest"),
        _textfield('Other skills', controller, "Enter your other skills"),
      ],
    );
  }

  Column _emailInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: WidgetText(title: 'Email Information', isBold: true, size: 16),
        ),
        _textfield('Email', controller, "Enter your email address"),
        _textfield(
          'Alternate email',
          controller,
          "Enter your alternate email address",
        ),
      ],
    );
  }

  Column _resume() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: WidgetText(title: 'Resume', isBold: true, size: 14),
        ),
        const Gap(5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: WidgetButton(
            text: 'Choose file',
            onTap: () {},
            textColor: Palette.primary,
            borderColor: Palette.primary,
            borderRadius: 12,
          ),
        ),
      ],
    );
  }

  Widget _textfield(
    String header,
    TextEditingController controller,
    String hint, {
    bool isSufix = false,
    bool isfilled = false,
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
            isFilled: isfilled,
          ),
        ],
      ),
    );
  }
}
