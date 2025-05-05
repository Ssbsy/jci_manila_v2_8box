import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/core/constants/comment_reaction.dart';
import 'package:jci_manila_v2/core/models/comment.dart';
import 'package:jci_manila_v2/core/models/feed.dart';

class CommentsScreen extends StatefulWidget {
  final Feed feed;
  const CommentsScreen({super.key, required this.feed});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  bool isLiked = CommentReaction.like;
  @override
  Widget build(BuildContext context) {
    final List<Comment> comments = [
      Comment(
        id: widget.feed.id,
        user: 'Heather Auer',
        userPhoto: widget.feed.userPhoto,
        time: '1 mins',
        comment:
            'Wow! How about you help me train how to swing? Who knows, I might be your opponent in the future.',
      ),
    ];

    String reaction = widget.feed.reactions.toString();
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            _header(reaction, context),
            const Divider(),
            ...comments.map(
              (comment) => ListTile(
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [comment.userPhoto],
                ),
                title: WidgetText(title: comment.user),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 0.5),
                      ),
                      child: WidgetText(title: comment.comment, maxLine: 10),
                    ),

                    Row(
                      spacing: 10,
                      children: [
                        WidgetText(title: comment.time),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isLiked = !isLiked;
                              CommentReaction.like = isLiked;
                            });
                          },
                          child: WidgetText(
                            title: 'Like',
                            color:
                                CommentReaction.like
                                    ? Colors.red
                                    : Palette.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
            spacing: 5,
            children: [
              const WidgetText(title: 'Close'),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.close),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
