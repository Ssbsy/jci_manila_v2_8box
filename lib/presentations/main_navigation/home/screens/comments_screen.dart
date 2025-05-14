import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              _header(reaction, context),
              const Divider(),

              const Expanded(
                child: Center(
                  child: WidgetText(
                    title: 'No comments yet',
                    color: Colors.grey,
                  ),
                ),
              ),

              Consumer<CreateCommentProvider>(
                builder:
                    (context, provider, _) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            offset: const Offset(0, -1),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _commentController,
                              decoration: const InputDecoration(
                                hintText: 'Write a comment...',
                                border: InputBorder.none,
                              ),
                              minLines: 1,
                              maxLines: 3,
                            ),
                          ),
                          IconButton(
                            onPressed:
                                provider.isLoading
                                    ? null
                                    : () async {
                                      final commentText =
                                          _commentController.text.trim();
                                      if (commentText.isEmpty) return;

                                      final response = await provider
                                          .createPost(
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
                            icon:
                                provider.isLoading
                                    ? const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    )
                                    : const Icon(
                                      Icons.send,
                                      color: Palette.primary,
                                    ),
                          ),
                        ],
                      ),
                    ),
              ),
            ],
          ),
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
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                WidgetText(title: 'Liked by $reaction others', isBold: true),
                Icon(Icons.arrow_forward_ios, size: 15),
              ],
            ),
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
