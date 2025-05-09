import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/core/providers/profile_provider.dart';
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
          _col('Director', profile.boardOfDirector),
          _col('Commisioner', profile.commissionership),
          _col('Chairman', profile.chairmanship),
          _col('Commitee', profile.position), // Note: Walang Commitee...
          _col('Previous Projects', profile.previousProjects),
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
