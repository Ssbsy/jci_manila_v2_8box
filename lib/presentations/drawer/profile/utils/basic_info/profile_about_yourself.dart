import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/core/providers/profile_provider.dart';
import 'package:provider/provider.dart';

class ProfileAboutYourself extends StatelessWidget {
  const ProfileAboutYourself({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<ProfileProvider>(context);

    if (profile.isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(color: Palette.neutralLightGray),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WidgetText(
            title: 'About yourself',
            color: Palette.black,
            isBold: true,
            size: 14,
          ),
          const Gap(5),
          WidgetText(
            title: profile.aboutyourself,
            color: Palette.black,
            maxLine: 10,
          ),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 70,
            children: [
              _col('First Name', profile.firstName),
              _col('Last Name', profile.lastName),
            ],
          ),
          const Gap(15),
          _col('Middle Name', profile.middleName),
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
