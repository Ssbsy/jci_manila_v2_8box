import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/core/providers/accounts/profile/profile_provider.dart';
import 'package:provider/provider.dart';

class ProfileUniversityOfLeadersOrientationDate extends StatelessWidget {
  const ProfileUniversityOfLeadersOrientationDate({super.key});

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
        spacing: 10,
        children: [
          // _col('University of Leaders Orientation Date', profile.user!.uloDate),
          Row(
            spacing: 35,
            children: [
              // _col('Launch Pad Date', profile.user!.launchPadDate ),
              _col(
                'Year Inducted (Baby JC)',
                profile.user?.yearInductedBaby.toString() ?? 'null',
              ),
            ],
          ),
          _col(
            'Year Inducted (Baby JC)',
            profile.user?.yearInductedBaby.toString() ?? 'null',
          ),
          _col(
            'BJC Project Presentation Date',
            profile.user?.bjcProjectPresentationDate.toString() ?? 'null',
          ),
          Row(
            spacing: 10,
            children: [
              // _col('Induction Date', profile.user!.inductionDate),
              // _col('Year Inducted (Regular)', profile.user!.inductionDate),
            ],
          ),
          // _col('Awards Received', profile.user!.awardsReceived),
        ],
      ),
    );
  }

  Column _col(String title, String subTitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetText(title: title, isBold: true, size: 11),
        WidgetText(title: subTitle, size: 9),
      ],
    );
  }
}
