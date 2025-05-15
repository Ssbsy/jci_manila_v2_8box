import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/core/providers/auth/auth_provider.dart';
import 'package:jci_manila_v2/presentations/main_navigation/home/screens/reactions_screen.dart';
import 'package:provider/provider.dart';
import 'package:jci_manila_v2/app/components/widget_feed_post.dart';
import 'package:jci_manila_v2/core/models/feed.dart';
import 'package:jci_manila_v2/core/providers/posts/get_all_posts_provider.dart';
import 'package:jci_manila_v2/presentations/main_navigation/home/screens/comments_screen.dart';

class HomePageFeed extends StatefulWidget {
  const HomePageFeed({super.key});

  @override
  State<HomePageFeed> createState() => _HomePageFeedState();
}

class _HomePageFeedState extends State<HomePageFeed> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GetAllPostsProvider>(context, listen: false).getPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final currentUserId = authProvider.userData?['user']['id'];

    return Consumer<GetAllPostsProvider>(
      builder: (context, postProvider, _) {
        final posts = postProvider.postData;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: WidgetText(title: 'Feeds', size: 18, isBold: true),
            ),
            const Gap(10),
            if (postProvider.isLoading)
              const Center(child: CircularProgressIndicator())
            else if (posts.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: WidgetText(title: 'No posts available.'),
              )
            else
              ..._buildFeeds(posts, currentUserId.toString()),
          ],
        );
      },
    );
  }

  Widget _buildFeed(BuildContext context, Feed feed) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: Palette.white,
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
                    builder:
                        (context) => SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: CommentsScreen(feed: feed),
                        ),
                  ),
              reactionOnTap:
                  () => showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder:
                        (context) => SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: ReactionsScreen(),
                        ),
                  ),
            ),
            const Gap(10),
            const Divider(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildFeeds(List<dynamic> posts, String currentUserId) {
    final feeds =
        posts
            .whereType<Map<String, dynamic>>()
            .map((data) => Feed.fromMap(data, currentUserId))
            .toList();

    return feeds.map((feed) => _buildFeed(context, feed)).toList();
  }
}
