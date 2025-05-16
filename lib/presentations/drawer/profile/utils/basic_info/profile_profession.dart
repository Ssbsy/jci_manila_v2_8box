import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/core/providers/profile/profile_provider.dart';
import 'package:provider/provider.dart';

class ProfileProfession extends StatelessWidget {
  const ProfileProfession({super.key});

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
          Row(
            spacing: 60,
            children: [
              _col('Profession', profile.user?.profession ?? 'null'),
              _col(
                'Employment Status',
                profile.user?.employmentStatus ?? 'null',
              ),
            ],
          ),
          Row(
            spacing: 40,
            children: [
              _col('Company', profile.user?.company ?? 'null'),
              _col('Industry', profile.user?.industry ?? 'null'),
            ],
          ),
          _col('Office Address', profile.user?.officeAddress ?? 'null'),
          _col('Office City', profile.user?.officeCity ?? 'null'),
        ],
      ),
    );
  }

  Column _col(String title, String subTitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetText(title: title, isBold: true),
        WidgetText(title: subTitle),
      ],
    );
  }
}
