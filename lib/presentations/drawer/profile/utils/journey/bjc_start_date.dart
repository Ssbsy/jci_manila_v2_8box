import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/core/providers/accounts/profile/profile_provider.dart';
import 'package:provider/provider.dart';

class BjcStartDate extends StatelessWidget {
  const BjcStartDate({super.key});

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
          _col('BJC Start Date', 'null'),
          _col('Sponsor Name', profile.user?.sponsorName ?? 'null'),
          _col(
            'JCI Area Conference Events',
            profile.user?.jciAreaConferenceEvents ?? 'null',
          ),
          _col(
            'JCI Asia Pacific Conference',
            profile.user?.jciAsiaPacificConference ?? 'null',
          ),
          _col('JCI World Congress', profile.user?.jciWorldCongress ?? 'null'),
          _col(
            'JCI National Convention',
            profile.user?.jcipNationalConvention ?? 'null',
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
