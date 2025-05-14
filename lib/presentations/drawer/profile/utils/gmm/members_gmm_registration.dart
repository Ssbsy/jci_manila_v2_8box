import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/core/providers/profile/profile_provider.dart';
import 'package:provider/provider.dart';

class MembersGmmRegistration extends StatelessWidget {
  const MembersGmmRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<ProfileProvider>(context);

    if (profile.isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Column(
      children: [
        WidgetText(title: 'Member GMM Registration', isBold: true),
        Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(color: Palette.neutralLightGray),
          child: Column(children: [
            ],
          ),
        ),
      ],
    );
  }
}
