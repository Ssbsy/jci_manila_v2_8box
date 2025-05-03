import 'package:flutter/material.dart';

class Feed {
  final String user;
  final int time;
  final String? post;
  final Widget? img;
  final int reactions;
  Feed({
    required this.user,
    required this.time,
    required this.reactions,
    this.post,
    this.img,
  });
}
