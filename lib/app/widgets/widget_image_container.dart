import 'dart:math' as math;

import 'package:flutter/material.dart';

class WidgetImageContainer extends StatelessWidget {
  final String imageAsset;
  final double alpha;
  final Widget? child;
  final BorderRadius? radius;

  const WidgetImageContainer({
    super.key,
    required this.imageAsset,
    required this.alpha,
    this.child,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radius ?? BorderRadius.zero,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationX(math.pi),
            child: Image.asset(
              imageAsset,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              color: Colors.black.withOpacity(alpha),
              colorBlendMode: BlendMode.darken,
            ),
          ),
          if (child != null) child!,
        ],
      ),
    );
  }
}
