import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_button.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';

class GmmPageWidget extends StatelessWidget {
  const GmmPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        spacing: 5,
        children: [
          WidgetText(title: 'Member GMM Registration', isBold: true),
          _container(context, 'title', 'title'),
        ],
      ),
    );
  }

  Container _container(
    BuildContext context,
    String title,
    String subTitle, {
    VoidCallback? onTap,
  }) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WidgetText(title: title),
          WidgetText(title: subTitle),
          WidgetButton(
            text: 'text',
            onTap: onTap ?? () {},
            containerWidth: MediaQuery.of(context).size.width * 0.3,
            containerColor: Palette.accentBlue,
            textColor: Palette.neutralWhite,
          ),
        ],
      ),
    );
  }
}
