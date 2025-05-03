import 'package:flutter/material.dart';

class Feed {
  final String user;
  final Widget userPhoto;
  final int time;
  final String? post;
  final Widget? img;
  final int reactions;
  Feed({
    required this.user,
    required this.userPhoto,
    required this.time,
    required this.reactions,
    this.post,
    this.img,
  });
}
