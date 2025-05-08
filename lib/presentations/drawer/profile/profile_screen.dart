import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/core/constants/images.dart';
import 'package:jci_manila_v2/presentations/drawer/profile/components/profile_appbar.dart';
import 'package:jci_manila_v2/presentations/drawer/profile/utils/profile_about_yourself.dart';
import 'package:jci_manila_v2/presentations/drawer/profile/utils/profile_civil_status.dart';
import 'package:jci_manila_v2/presentations/drawer/profile/utils/profile_contact_no.dart';
import 'package:jci_manila_v2/presentations/drawer/profile/utils/profile_highschool.dart';
import 'package:jci_manila_v2/presentations/drawer/profile/utils/profile_home_address.dart';
import 'package:jci_manila_v2/presentations/drawer/profile/utils/profile_options.dart';
import 'package:jci_manila_v2/presentations/drawer/profile/utils/profile_profession.dart';
import 'package:jci_manila_v2/presentations/drawer/profile/utils/profile_shipping_address.dart';
import 'package:jci_manila_v2/presentations/drawer/profile/utils/profile_sports.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                      decoration: BoxDecoration(
                        color: Palette.neutralLightGray,
                      ),
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
                    ProfileOptions(),
                    const Gap(10),
                    ProfileAboutYourself(),
                    _divider(),
                    ProfileHomeAddress(),
                    _divider(),
                    ProfileCivilStatus(),
                    _divider(),
                    ProfileShippingAddress(),
                    _divider(),
                    ProfileContactNo(),
                    _divider(),
                    ProfileHighschool(),
                    _divider(),
                    ProfileProfession(),
                    _divider(),
                    ProfileSports(),
                    const Gap(20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column _divider() {
    return Column(
      children: [const Gap(10), const Divider(thickness: 1), const Gap(10)],
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
