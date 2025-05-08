import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/presentations/drawer/profile/utils/basic_info/profile_about_yourself.dart';
import 'package:jci_manila_v2/presentations/drawer/profile/utils/basic_info/profile_civil_status.dart';
import 'package:jci_manila_v2/presentations/drawer/profile/utils/basic_info/profile_contact_no.dart';
import 'package:jci_manila_v2/presentations/drawer/profile/utils/basic_info/profile_highschool.dart';
import 'package:jci_manila_v2/presentations/drawer/profile/utils/basic_info/profile_home_address.dart';
import 'package:jci_manila_v2/presentations/drawer/profile/utils/basic_info/profile_profession.dart';
import 'package:jci_manila_v2/presentations/drawer/profile/utils/basic_info/profile_shipping_address.dart';
import 'package:jci_manila_v2/presentations/drawer/profile/utils/basic_info/profile_sports.dart';

class BasicInfoPageWidget extends StatelessWidget {
  const BasicInfoPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
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
          const Gap(10),
        ],
      ),
    );
  }

  Column _divider() {
    return Column(
      children: [const Gap(10), const Divider(thickness: 1), const Gap(10)],
    );
  }
}
