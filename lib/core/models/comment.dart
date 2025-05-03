import 'package:flutter/cupertino.dart';

class Comment {
  final int? id;
  final String user;
  final Widget userPhoto;
  final String time;
  final String comment;
  final bool? isLiked;
  Comment({
    required this.user,
    required this.userPhoto,
    required this.time,
    this.isLiked,
    required this.comment,
    this.id,
  });
}
