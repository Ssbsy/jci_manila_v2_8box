import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';

class WidgetText extends StatelessWidget {
  final String title;
  final double size;
  final Color color;
  final bool isBold;
  final bool isJustified;
  final int maxLine;
  final bool isCentered;
  final TextStyle? style;
  const WidgetText({
    super.key,
    required this.title,
    this.size = 12,
    this.color = Palette.black,
    this.isBold = false,
    this.isJustified = false,
    this.maxLine = 1,
    this.isCentered = false,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign:
          isJustified
              ? TextAlign.justify
              : (isCentered ? TextAlign.center : TextAlign.start),
      maxLines: maxLine,
      style:
          style ??
          TextStyle(
            fontSize: size,
            color: color,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
    );
  }
}
