import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/core/constants/images.dart';
import 'package:jci_manila_v2/presentations/drawer/resources/components/resource_screen_appbar.dart';
import 'package:jci_manila_v2/presentations/drawer/resources/constants/resources_texts.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResourceScreenAppbar(title: 'History'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Images.historyPhoto,
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  WidgetText(
                    title: ResourcesTexts.historyTitle,
                    color: Palette.primary,
                    size: 20,
                    maxLine: 10,
                    isBold: true,
                  ),
                  const Gap(10),
                  WidgetText(
                    title: ResourcesTexts.historyDescription,
                    maxLine: 50,
                    isJustified: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
