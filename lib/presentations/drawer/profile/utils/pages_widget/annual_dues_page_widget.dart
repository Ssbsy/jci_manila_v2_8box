import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AnnualDuesPageWidget extends StatelessWidget {
  const AnnualDuesPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(children: [const Gap(10)]),
    );
  }

  Column _divider() {
    return Column(
      children: [const Gap(10), const Divider(thickness: 1), const Gap(10)],
    );
  }
}
