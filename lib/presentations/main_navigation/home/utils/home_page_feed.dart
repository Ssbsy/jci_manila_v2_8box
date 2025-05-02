import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/presentations/main_navigation/home/const/assets.dart';
import 'package:jci_manila_v2/presentations/main_navigation/home/utils/home_page_feed_reaction.dart';
import 'package:jci_manila_v2/presentations/main_navigation/home/utils/home_page_feed_header.dart';

class HomePageFeed extends StatelessWidget {
  const HomePageFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            'Feeds',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        const Divider(thickness: 1),
        HomePageFeedHeader(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text('Practicing my shot for the event'),
        ),
        const Gap(10),
        Assets.golfSwing1,
        HomePageFeedReaction(),
        const Divider(thickness: 1),
      ],
    );
  }
}
