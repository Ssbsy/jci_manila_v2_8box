import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/app/components/widget_custom_appbar.dart';
import 'package:jci_manila_v2/app/components/widget_drawer.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/core/constants/images.dart';

class SponsorDetailsScreen extends StatelessWidget {
  const SponsorDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WidgetCustomAppbar(
              isBack: true,
              title: 'Sponsors Details',
              textColor: Colors.white,
              isbold: true,
            ),
            Images.tklSteelCorpImg,
            _description(),
          ],
        ),
      ),
      endDrawer: WidgetDrawer(),
    );
  }

  Padding _description() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WidgetText(title: 'TKL Steel Corp', isBold: true, size: 20),
          const Gap(5),
          WidgetText(
            title:
                'TKL Steel Corp is a leading steel distributor in the Philippines, established in 1989. It supplies a wide range of steel products, including angle bars, steel plates, and pipes, serving industries such as construction and manufacturing.',
            maxLine: 10,
            isJustified: true,
          ),
          const Gap(15),
          _types('Owner', 'Laurence C. Tan'),
          _types('Sponsor Type', 'Platinum'),
          _types('Category', 'Steel, Distribution'),
          const Gap(20),
          const Divider(),
          const Gap(20),
          WidgetText(title: 'Contact Information', isBold: true, size: 20),
          const Gap(10),
          _contactInfo('Contact Number', '+63 29 592 3501'),
          const Gap(10),
          _contactInfo('Email Address', 'tklofficial@tkl.com'),
          const Gap(20),
          const Divider(),
          const Gap(20),
          WidgetText(title: 'Official Directories', isBold: true, size: 20),
          const Gap(10),
          _officialDirectories('Website', 'tkl.com.ph'),
          const Gap(10),
          _officialDirectories('Facebook', 'TKL Steel'),
          const Gap(10),
          _officialDirectories('X (Formerly Twitter)', '@TKLSteelPh'),
        ],
      ),
    );
  }

  Column _officialDirectories(String title, String subTitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 3,
      children: [
        WidgetText(title: title),
        WidgetText(title: subTitle, isUnderlined: true),
      ],
    );
  }

  Column _contactInfo(String title, String subTitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 3,
      children: [WidgetText(title: title), WidgetText(title: subTitle)],
    );
  }

  Column _types(String title, String subTitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetText(title: title, style: TextStyle(fontWeight: FontWeight.w500)),
        WidgetText(title: subTitle),
      ],
    );
  }
}
