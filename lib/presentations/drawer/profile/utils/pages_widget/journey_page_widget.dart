import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/presentations/drawer/profile/utils/journey/profile_membership.dart';
import 'package:jci_manila_v2/presentations/drawer/profile/utils/journey/profile_university_of_leaders_orientation_date.dart';

class JourneyPageWidget extends StatelessWidget {
  const JourneyPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          ProfileMembership(),
          _divider(),
          ProfileUniversityOfLeadersOrientationDate(),
          _divider(),
          Gap(10),
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
