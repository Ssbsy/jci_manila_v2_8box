import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/core/providers/auth_provider.dart';
import 'package:jci_manila_v2/core/providers/posts/create_posts_provider.dart';
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
    Future.microtask(
      () => Provider.of<GetAllPostsProvider>(context, listen: false).getPosts(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<GetAllPostsProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);
    final posts = postProvider.postData;

    final currentUserId = authProvider.userData?['user']['id'];

    if (currentUserId == null) {
      return Center(child: Text('Please log in to view posts.'));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            'Feeds',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        const Gap(10),
        if (postProvider.isLoading)
          const Center(child: CircularProgressIndicator())
        else if (posts.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Text('No posts available.'),
          )
        else
          ...posts.map((data) {
            final feed = Feed.fromMap(data!, currentUserId.toString());
            return _buildFeed(context, feed);
          }).toList(),
      ],
    );
  }

  Widget _buildFeed(BuildContext context, Feed feed) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
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
                    builder:
                        (context) => SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: CommentsScreen(feed: feed),
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
}
