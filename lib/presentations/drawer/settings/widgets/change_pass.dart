import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/components/widget_text_field.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/presentations/drawer/settings/widgets/change_pass_success.dart';

class ChangePass extends StatelessWidget {
  const ChangePass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.neutralWhite,
      appBar: AppBar(
        backgroundColor: Palette.gradientStart,
        elevation: 0,
        iconTheme: const IconThemeData(color: Palette.white),
        title: const Text(
          'Change Password',
          style: TextStyle(color: Palette.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WidgetText(
              title: 'Current Password',
              isBold: false,
              size: 14,
            ),
            const Gap(6),
            WidgetTextField(
              controller: TextEditingController(),
              hintText: 'Enter your old password',
              hintStyle: const TextStyle(color: Palette.neutralGray),
              obscureText: true,
              fillColor: Palette.neutralWhite,
              isFilled: true,
              enabledBorderSideColor: Palette.neutralGray,
              focusedBorderSideColor: Palette.accentBlue,
            ),
            const Gap(12),

            const WidgetText(title: 'New Password', isBold: false, size: 14),
            const Gap(6),
            WidgetTextField(
              controller: TextEditingController(),
              hintText: 'Enter your new password',
              hintStyle: const TextStyle(color: Palette.neutralGray),
              obscureText: true,
              fillColor: Palette.neutralWhite,
              isFilled: true,
              enabledBorderSideColor: Palette.neutralGray,
              focusedBorderSideColor: Palette.accentBlue,
            ),
            const Gap(12),

            const WidgetText(
              title: 'Confirm New Password',
              isBold: false,
              size: 14,
            ),
            const Gap(6),
            WidgetTextField(
              controller: TextEditingController(),
              hintText: 'Re-enter your new password',
              hintStyle: const TextStyle(color: Palette.neutralGray),
              obscureText: true,
              fillColor: Palette.neutralWhite,
              isFilled: true,
              enabledBorderSideColor: Palette.neutralGray,
              focusedBorderSideColor: Palette.accentBlue,
            ),
            const Gap(24),

            SizedBox(
              width: double.infinity,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ChangePassSuccess(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Palette.accentBlue,
                    foregroundColor: Palette.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Change Password',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
