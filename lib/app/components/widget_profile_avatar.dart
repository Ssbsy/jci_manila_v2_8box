import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';

class WidgetProfileAvatar extends StatefulWidget {
  final String? imageAsset;
  const WidgetProfileAvatar({super.key, this.imageAsset});

  @override
  State<WidgetProfileAvatar> createState() => _WidgetProfileAvatarState();
}

class _WidgetProfileAvatarState extends State<WidgetProfileAvatar> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Palette.black.withValues(alpha: 0.3),
      backgroundImage: NetworkImage(widget.imageAsset.toString()),
    );
  }
}
