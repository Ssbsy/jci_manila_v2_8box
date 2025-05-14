import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/core/providers/profile/profile_provider.dart';
import 'package:provider/provider.dart';

class ProfileMembership extends StatelessWidget {
  const ProfileMembership({super.key});

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
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 50,
            children: [
              _col('Membership', profile.membership),
              _col('Membership ID', profile.membershipID),
            ],
          ),
          Row(
            spacing: 60,
            children: [
              _col('JCI Phil ID', profile.jciPhilID),
              _col('JCI Sen No.', profile.jciSenNo),
            ],
          ),
          _col('Care Group', profile.careGroup),
          _col('Current Position', profile.currentPosition),
          _col(
            'Current Position Directorate',
            profile.currentPositionDirectorate,
          ),
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
