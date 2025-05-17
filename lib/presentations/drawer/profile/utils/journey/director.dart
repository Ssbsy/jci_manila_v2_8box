import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/core/providers/accounts/profile/profile_provider.dart';
import 'package:provider/provider.dart';

class Director extends StatelessWidget {
  const Director({super.key});

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
          _col('Director', profile.user?.boardOfDirector ?? 'null'),
          _col('Commisioner', profile.user?.commissionership ?? 'null'),
          _col('Chairman', profile.user?.chairmanship ?? 'null'),
          _col(
            'Commitee',
            profile.user?.position ?? 'null',
          ), // Note: Walang Commitee...
          _col('Previous Projects', profile.user?.previousProjects ?? 'null'),
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
