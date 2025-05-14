import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/core/constants/comment_reaction.dart';
import 'package:jci_manila_v2/core/models/feed.dart';
import 'package:jci_manila_v2/core/providers/posts/create_comment_provider.dart';

class CommentsScreen extends StatefulWidget {
  final Feed feed;
  const CommentsScreen({super.key, required this.feed});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  bool isLiked = CommentReaction.like;
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String reaction = widget.feed.reactions.toString();

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            _header(reaction, context),
            const Divider(),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Consumer<CreateCommentProvider>(
                builder:
                    (context, provider, _) => Column(
                      children: [
                        TextField(
                          controller: _commentController,
                          decoration: const InputDecoration(
                            hintText: 'Write a comment...',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 3,
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed:
                              provider.isLoading
                                  ? null
                                  : () async {
                                    final commentText =
                                        _commentController.text.trim();
                                    if (commentText.isEmpty) return;

                                    final response = await provider.createPost(
                                      postID: widget.feed.id.toString(),
                                      comment: commentText,
                                    );

                                    if (response['success']) {
                                      _commentController.clear();
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text('Comment posted'),
                                        ),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            response['message'] ??
                                                'Failed to post comment',
                                          ),
                                        ),
                                      );
                                    }
                                  },
                          child:
                              provider.isLoading
                                  ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                  : const Text('Post Comment'),
                        ),
                      ],
                    ),
              ),
            ),

            const Expanded(
              child: Center(
                child: WidgetText(title: 'No comments yet', color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _header(String reaction, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              WidgetText(title: 'Liked by $reaction others', isBold: true),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward_ios, size: 15),
              ),
            ],
          ),
          Row(
            children: [
              const WidgetText(title: 'Close'),
              const SizedBox(width: 5),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.close),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
