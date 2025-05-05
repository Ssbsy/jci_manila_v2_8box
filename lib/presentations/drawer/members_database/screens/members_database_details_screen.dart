import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/core/constants/images.dart';
import 'package:jci_manila_v2/core/models/members_database_model.dart';

class MembersDatabaseDetailsScreen extends StatefulWidget {
  final MembersDatabaseModel database;
  const MembersDatabaseDetailsScreen({super.key, required this.database});

  @override
  State<MembersDatabaseDetailsScreen> createState() =>
      _MembersDatabaseDetailsScreenState();
}

class _MembersDatabaseDetailsScreenState
    extends State<MembersDatabaseDetailsScreen> {
  late Color badgeColor;
  late String badge;

  @override
  void initState() {
    super.initState();
    _setBadgeInfo(widget.database.badge);
  }

  void _setBadgeInfo(Widget badgeWidget) {
    if (badgeWidget == Images.yellowBadge) {
      badgeColor = Palette.warmGoldenYellow;
      badge = 'Yellow Badge';
    } else if (badgeWidget == Images.brownBadge) {
      badgeColor = Palette.veryPalePinkPeachCream;
      badge = 'Bronze Badge';
    } else if (badgeWidget == Images.silverBadge) {
      badgeColor = Palette.neutralGray;
      badge = 'Silver Badge';
    }
  }

  @override
  Widget build(BuildContext context) {
    final String fullName =
        widget.database.firstName + widget.database.lastName;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              _appBar(),
              const Gap(20),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 5,
                ),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Palette.neutralGray),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WidgetText(title: badge, isBold: true, size: 16),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(color: badgeColor),
                        child: Row(
                          children: [
                            Images.seanPatrick02Png,
                            const Gap(10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  WidgetText(title: fullName),
                                  WidgetText(
                                    title: 'JCI Manila Member Since 2016',
                                  ),
                                ],
                              ),
                            ),
                            Images.badge,
                          ],
                        ),
                      ),
                      Divider(color: badgeColor, thickness: 2),
                      const Gap(10),
                      _info('Work/Business', 'Seo Hacker Digital Marketing'),
                      const Gap(10),
                      _info('BirthDay', 'June 09, 1988'),
                      const Gap(10),
                      _info('JCI Career', 'Director'),
                      const Gap(10),
                      _info(
                        'Commisioner',
                        '2018 / Commisioner (Marketing) under Dir Micheal Uy',
                      ),
                      const Gap(10),
                      WidgetText(title: 'Commitee', isBold: true),
                      const Gap(20),
                      _info('Interest', 'No data found'),
                      const Gap(10),
                      _info('Email', 'lorem@gmail.com'),
                      const Gap(10),
                      _info('Contact Number', '09123456789'),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  spacing: 15,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WidgetText(title: 'Business List', isBold: true, size: 16),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Palette.neutralGray,
                        ),
                      ),
                      child: Row(
                        spacing: 10,
                        children: [
                          Images.hackerIcon,
                          WidgetText(
                            title: 'SEO Hacker',
                            isBold: true,
                            size: 14,
                            color: Palette.veryDarkNavy,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column _info(String title, String content) {
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetText(title: title, isBold: true),
        WidgetText(title: content, color: Palette.neutralGray),
      ],
    );
  }

  Container _appBar() {
    return Container(
      decoration: BoxDecoration(color: Color(0xFF1B1C2B)),
      padding: const EdgeInsets.all(20),
      child: Row(
        spacing: 20,
        children: [
          GestureDetector(
            onTap: () => Get.offAllNamed('/database'),
            child: Icon(Icons.arrow_back_ios, color: Palette.white, size: 20),
          ),
          WidgetText(title: 'Details', color: Palette.white, size: 16),
        ],
      ),
    );
  }
}
