import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/app/components/widget_feed_post.dart';
import 'package:jci_manila_v2/core/models/feed.dart';
import 'package:jci_manila_v2/presentations/main_navigation/home/const/assets.dart';
import 'package:jci_manila_v2/presentations/main_navigation/home/screens/comments_screen.dart';

class HomePageFeed extends StatefulWidget {
  final Feed? feed;
  const HomePageFeed({super.key, this.feed});

  @override
  State<HomePageFeed> createState() => _HomePageFeedState();
}

class _HomePageFeedState extends State<HomePageFeed> {
  final List<Feed> feeds = [
    Feed(
      id: 1,
      user: 'Earl Huel',
      reactions: 8,
      post: 'Practicing my shot for the event.',
      time: '1 min',
      userPhoto: Assets.earlHuelPng,
      img: Assets.golfSwing1,
    ),
    Feed(
      id: 2,
      user: 'Roy Dickens',
      reactions: 20,
      post:
          'Has anyone here wants to join our group? if you want to join just contact me.',
      time: '20 mins',
      userPhoto: Assets.earlHuelPng,
    ),
    Feed(
      id: 3,
      user: 'Alyssa White',
      reactions: 425,
      post: 'I am new here! Can anyone teach me how to use this app?',
      time: '1 hr',
      userPhoto: Assets.earlHuelPng,
    ),
    Feed(
      id: 4,
      user: 'Matthew Hill',
      reactions: 8,
      post:
          'Hello guys! Anyone here excited about the upcoming ASPAC Mongolia?! I am already here at my hotel.',
      time: '15 mins',
      userPhoto: Assets.earlHuelPng,
      img: Assets.golfSwing1,
    ),
  ];
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
        const Gap(10),
        ...List.generate(
          feeds.length,
          (index) => _buildFeed(context, feeds[index]),
        ),
      ],
    );
  }

  Widget _buildFeed(BuildContext context, Feed feed) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(0),
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            WidgetFeedPost(
              feed: feed,
              commentOnTap:
                  () => showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: CommentsScreen(feed: feed),
                      );
                    },
                  ),
            ),
            const Gap(10),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
