import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/core/providers/profile_provider.dart';
import 'package:provider/provider.dart';

class ProfileContactNo extends StatelessWidget {
  const ProfileContactNo({super.key});

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
            spacing: 30,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _col(
                isCentered: false,
                'Contact Number 1',
                profile.contactNumber,
              ),
              _col(
                isCentered: false,
                'Contact Number 2',
                profile.contactNumber2,
              ),
            ],
          ),
          _col(isCentered: false, 'Tel/Fax', profile.telNoFax),
          const Gap(10),
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
