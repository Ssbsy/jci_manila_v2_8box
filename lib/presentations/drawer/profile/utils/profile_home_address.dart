import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';

class ProfileHomeAddress extends StatelessWidget {
  const ProfileHomeAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: Palette.neutralGray),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _col(
            isCentered: false,
            'Home Address',
            '3/F C&C Business Center, Aguire Avenue, BF',
          ),
          _col(isCentered: false, 'City', 'Parañaque'),
          _col(isCentered: false, 'Contact', '0939-922-2730'),
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
