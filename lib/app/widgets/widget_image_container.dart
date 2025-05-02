import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';

class WidgetImageContainer extends StatelessWidget {
  final String imageAsset;
  final double alpha;
  final dynamic child;
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
    return Container(
      decoration: BoxDecoration(
        borderRadius: radius,
        image: DecorationImage(
          image: AssetImage(imageAsset),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Palette.black.withValues(alpha: alpha),
            BlendMode.darken,
          ),
        ),
      ),
      child: child,
    );
  }
}
