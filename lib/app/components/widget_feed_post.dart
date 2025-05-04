import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/core/constants/feed_reaction.dart';
import 'package:jci_manila_v2/core/models/feed.dart';

class WidgetFeedPost extends StatefulWidget {
  final Feed feed;
  final VoidCallback? onTap;
  final VoidCallback? reactionOnTap;
  final VoidCallback? commentOnTap;
  const WidgetFeedPost({
    super.key,
    required this.feed,
    this.onTap,
    this.reactionOnTap,
    this.commentOnTap,
  });

  @override
  State<WidgetFeedPost> createState() => _WidgetFeedPostState();
}

class _WidgetFeedPostState extends State<WidgetFeedPost> {
  bool isLiked = FeedReaction.like;
  @override
  Widget build(BuildContext context) {
    String reaction = widget.feed.reactions.toString();
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _header(),
          const Gap(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: WidgetText(title: widget.feed.post!, maxLine: 10),
          ),
          const Gap(10),
          widget.feed.img ?? const SizedBox.shrink(),
          const Gap(10),
          _bottom(reaction),
        ],
      ),
    );
  }

  Padding _bottom(String reaction) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 10,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isLiked = !isLiked;
                    FeedReaction.like = isLiked;
                  });
                  if (widget.reactionOnTap != null) {
                    widget.reactionOnTap!();
                  }
                },
                child:
                    FeedReaction.like
                        ? Icon(Icons.favorite, color: Colors.red)
                        : Icon(Icons.favorite_outline),
              ),
              WidgetText(title: FeedReaction.like ? 'Liked' : 'Like'),
              GestureDetector(
                onTap: widget.commentOnTap,
                child: Row(
                  spacing: 10,
                  children: [
                    Icon(FontAwesomeIcons.comment, size: 22),
                    WidgetText(title: 'Comment'),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              WidgetText(title: 'Liked by '),
              WidgetText(title: '$reaction others', isBold: true),
            ],
          ),
        ],
      ),
    );
  }

  Padding _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 10,
            children: [
              widget.feed.userPhoto,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WidgetText(title: widget.feed.user, isBold: true),
                  WidgetText(title: widget.feed.time, color: Colors.grey),
                ],
              ),
            ],
          ),
          GestureDetector(onTap: widget.onTap, child: Icon(Icons.more_horiz)),
        ],
      ),
    );
  }
}
