import 'package:flutter/material.dart';

class Feed {
  final int? id;
  final String user;
  final Widget userPhoto;
  final String time;
  final String? post;
  final Widget? img;
  final int reactions;
  final String? comment;
  Feed({
    required this.user,
    required this.userPhoto,
    required this.time,
    required this.reactions,
    this.post,
    this.img,
    this.id,
    this.comment,
  });
}
