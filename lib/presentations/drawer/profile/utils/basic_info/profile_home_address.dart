import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/core/providers/accounts/profile/profile_provider.dart';
import 'package:provider/provider.dart';

class ProfileHomeAddress extends StatelessWidget {
  const ProfileHomeAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<ProfileProvider>(context);

    if (profile.isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: Palette.neutralLightGray),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _col(
            isCentered: false,
            'Home Address',
            profile.user?.homeAddress ?? 'null',
          ),
          _col(isCentered: false, 'City', profile.user?.homeCity ?? 'null'),
          _col(
            isCentered: false,
            'Contact',
            profile.user?.contactNumber ?? 'null',
          ),
        ],
      ),
    );
  }

  Column _col(String title, String subTitle, {bool isCentered = true}) {
    return Column(
      crossAxisAlignment:
          isCentered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        WidgetText(title: title, isBold: true),
        WidgetText(title: subTitle),
      ],
    );
  }
}
