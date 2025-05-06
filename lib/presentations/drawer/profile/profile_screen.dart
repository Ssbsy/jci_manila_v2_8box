import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/core/constants/images.dart';
import 'package:jci_manila_v2/presentations/drawer/profile/components/profile_appbar.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.veryDarkBluishGray,
      appBar: ProfileAppbar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 80, height: 80, child: Images.profile_photo_01),
          const Gap(5),
          WidgetText(
            title: 'Padiernos, Jan Adrian D.',
            color: Palette.white,
            isBold: true,
            size: 16,
          ),
          const Gap(5),
          Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 15, child: Images.whiteBadge),
              WidgetText(title: 'Gold Member', color: Palette.white),
            ],
          ),
          const Gap(30),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Palette.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    QrImageView(
                      data: '1234567890',
                      version: QrVersions.auto,
                      size: 150.0,
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(color: Palette.neutralGray),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _col('GMM Count', '251'),
                          _col('Member Points', '178'),
                          _col('No. of Projects', '8'),
                        ],
                      ),
                    ),
                    const Gap(15),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        spacing: 5,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _container(
                            context,
                            color: Palette.primary,
                            'Basic Info',
                            Icon(Icons.info_outline, color: Palette.white),
                          ),
                          _container(
                            context,
                            isBordered: true,
                            stringColor: Palette.black,
                            'Journey',
                            Icon(Icons.timeline, color: Palette.black),
                          ),
                          _container(
                            context,
                            isBordered: true,
                            stringColor: Palette.black,
                            'GMM',
                            Icon(Icons.event_available, color: Palette.black),
                          ),
                          _container(
                            context,
                            'Projects',
                            isBordered: true,
                            stringColor: Palette.black,
                            Icon(Icons.info_outline, color: Palette.black),
                          ),
                          _container(
                            context,
                            'Annual Dues',
                            isBordered: true,
                            stringColor: Palette.black,
                            Icon(Icons.payment, color: Palette.black),
                          ),
                        ],
                      ),
                    ),
                    const Gap(10),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(color: Palette.neutralGray),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          WidgetText(
                            title: 'About yourself',
                            color: Palette.black,
                            isBold: true,
                            size: 14,
                          ),
                          const Gap(5),
                          WidgetText(
                            title:
                                "Motivational and leadership speaker in the Philippines. He is a certified John Maxwell team member and certified Reiss Profile Master.",
                            color: Palette.black,
                            maxLine: 10,
                          ),
                          const Gap(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            spacing: 100,
                            children: [
                              _col('First Name', 'Jan Adrian'),
                              _col('Last Name', 'Padiernos'),
                            ],
                          ),
                          const Gap(15),
                          _col('Middle Name', 'D.', isCentered: false),
                        ],
                      ),
                    ),
                    const Gap(10),
                    const Divider(thickness: 1),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _container(
    BuildContext context,
    String title,
    Icon icon, {
    Color color = Palette.transparent,
    Color stringColor = Palette.white,
    bool isBordered = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      width: MediaQuery.of(context).size.width * 0.25,
      decoration: BoxDecoration(
        color: color,
        border:
            isBordered ? Border.all(width: 0.5, color: Palette.black) : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [icon, WidgetText(title: title, color: stringColor)],
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
