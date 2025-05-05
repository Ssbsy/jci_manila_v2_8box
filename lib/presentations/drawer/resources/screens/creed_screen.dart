import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/presentations/drawer/resources/components/resource_screen_appbar.dart';
import 'package:jci_manila_v2/presentations/drawer/resources/constants/resources_texts.dart';

class CreedScreen extends StatelessWidget {
  const CreedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResourceScreenAppbar(title: 'Creed'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WidgetText(
                title: 'JCI Values',
                color: Palette.primary,
                size: 20,
                isBold: true,
              ),
              const Gap(10),
              WidgetText(
                title: ResourcesTexts.creedDescription,
                maxLine: 20,
                size: 14,
              ),
              const Gap(20),
              WidgetText(
                title: 'JCI Prayer',
                color: Palette.primary,
                size: 20,
                isBold: true,
              ),
              const Gap(10),
              WidgetText(
                title: ResourcesTexts.creedJCIPrayer,
                maxLine: 10,
                size: 14,
              ),
              const Gap(20),
              WidgetText(
                title: 'JCI Mission',
                color: Palette.primary,
                size: 20,
                isBold: true,
              ),
              const Gap(10),
              WidgetText(
                title: ResourcesTexts.creedJCIMission,
                maxLine: 10,
                size: 14,
              ),
              const Gap(20),
              WidgetText(
                title: 'JCI Vission',
                color: Palette.primary,
                size: 20,
                isBold: true,
              ),
              const Gap(10),
              WidgetText(
                title: ResourcesTexts.creedJCIVision,
                maxLine: 10,
                size: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
