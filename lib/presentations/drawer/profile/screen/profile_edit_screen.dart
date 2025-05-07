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
    return Scaffold(
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
            containerWidth: MediaQuery.of(context).size.width * 0.3,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: WidgetText(
                        title: 'Basic Information',
                        isBold: true,
                        size: 16,
                      ),
                    ),
                    _textfield(
                      'About yourself',
                      controller,
                      "Enter a short information about you",
                    ),
                    _textfield(
                      'First Name',
                      controller,
                      "Enter your first name",
                    ),
                    _textfield('Last Name', controller, "Enter your last name"),
                    _textfield(
                      'Middle Name',
                      controller,
                      "Enter your middle name",
                    ),
                    _textfield('Nickname', controller, "Enter your nickname"),
                    _textfield(
                      'Birthday',
                      controller,
                      "Select your date of birth",
                      isSufix: true,
                    ),
                    const Gap(10),
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
                    _textfield(
                      'Home City',
                      controller,
                      "Enter your first name",
                    ),
                    _textfield(
                      'Spouse Name',
                      controller,
                      "Enter your middle name",
                    ),
                    _textfield(
                      'Spouse Address',
                      controller,
                      "Enter your nickname",
                    ),
                    _textfield(
                      'Shipping Address',
                      controller,
                      "Select your date of birth",
                    ),
                    _textfield(
                      'Shipping City',
                      controller,
                      "Select your date of birth",
                    ),
                    _textfield(
                      'Shipping Zip',
                      controller,
                      "Select your date of birth",
                    ),
                    const Gap(10),
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
                      "Enter your nickname",
                    ),
                    _textfield(
                      'Highschool',
                      controller,
                      "Select your date of birth",
                    ),
                    _textfield(
                      'School graduated',
                      controller,
                      "Select your date of birth",
                    ),
                    _textfield(
                      'Course',
                      controller,
                      "Select your date of birth",
                    ),
                    const Gap(10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: WidgetText(
                        title: 'Personal Information',
                        isBold: true,
                        size: 16,
                      ),
                    ),
                    _textfield('Profession', controller, "Enter your nickname"),
                    _textfield(
                      'Employement Status',
                      controller,
                      "Select your date of birth",
                    ),
                    _textfield(
                      'Company',
                      controller,
                      "Select your date of birth",
                    ),
                    _textfield(
                      'Course',
                      controller,
                      "Select your date of birth",
                    ),
                    _textfield('Industry', controller, "Enter your nickname"),
                    _textfield(
                      'Office Address',
                      controller,
                      "Select your date of birth",
                    ),
                    _textfield(
                      'Office City',
                      controller,
                      "Select your date of birth",
                    ),
                    _textfield(
                      'Sponsor Name',
                      controller,
                      "Select your date of birth",
                    ),
                    _textfield(
                      'Sponsor ID',
                      controller,
                      "Select your date of birth",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
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
