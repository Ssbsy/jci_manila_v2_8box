import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';

class ProfileProfession extends StatelessWidget {
  const ProfileProfession({super.key});

  @override
  Widget build(BuildContext context) {
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
              _col('Profession', 'CEO/Founder'),
              _col('Employment Status', 'Self-Employed'),
            ],
          ),
          Row(
            spacing: 70,
            children: [
              _col('Company', 'SEO Hacker'),
              _col('Industry', 'Digital Marketing'),
            ],
          ),
          _col('Office Address', "3/F C&C Business Center, Aguire Avenue, BF"),
          _col('Office City', "Parañaque City"),
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
