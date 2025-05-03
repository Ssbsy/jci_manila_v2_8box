import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';

class WidgetTextField extends StatelessWidget {
  final TextEditingController controller;
  final double enabledBorderSide;
  final double enabledBorderRadius;
  final Color enabledBorderSideColor;
  final InputDecoration? decoration;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;
  final String? hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final int maxLines;
  final double? leftPadding;
  final double? rightPadding;
  final double? topPadding;
  final double? bottomPadding;
  final EdgeInsetsGeometry? padding;
  final Icon? suffixIcon;
  final double focusedBorderSide;
  final double focusedBorderRadius;
  final Color focusedBorderSideColor;
  final Color? fillColor;
  final bool? isFilled;
  final double contentPaddingVertical;
  final double contentPaddingHorizontal;
  final bool isContentPaddingNull;

  const WidgetTextField({
    super.key,
    required this.controller,
    this.enabledBorderSide = 1,
    this.enabledBorderRadius = 10,
    this.enabledBorderSideColor = Palette.black,
    this.decoration,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.textColor = Palette.black,
    this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.leftPadding,
    this.rightPadding,
    this.topPadding,
    this.bottomPadding,
    this.padding,
    this.suffixIcon,
    this.focusedBorderSide = 1,
    this.focusedBorderRadius = 10,
    this.focusedBorderSideColor = Palette.black,
    this.fillColor,
    this.isFilled = false,
    this.contentPaddingVertical = 12,
    this.contentPaddingHorizontal = 12,
    this.isContentPaddingNull = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          padding ??
          EdgeInsets.only(
            left: leftPadding ?? 0,
            right: rightPadding ?? 0,
            top: topPadding ?? 0,
            bottom: bottomPadding ?? 0,
          ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        maxLines: maxLines,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        ),
        decoration:
            decoration ??
            InputDecoration(
              contentPadding:
                  isContentPaddingNull
                      ? null
                      : EdgeInsets.symmetric(
                        vertical: contentPaddingVertical,
                        horizontal: contentPaddingHorizontal,
                      ),
              fillColor: fillColor,
              filled: isFilled,
              hintText: hintText,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: enabledBorderSide,
                  color: enabledBorderSideColor,
                ),
                borderRadius: BorderRadius.circular(enabledBorderRadius),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: focusedBorderSide,
                  color: focusedBorderSideColor,
                ),
                borderRadius: BorderRadius.circular(focusedBorderRadius),
              ),
              suffixIcon: suffixIcon,
            ),
      ),
    );
  }
}
