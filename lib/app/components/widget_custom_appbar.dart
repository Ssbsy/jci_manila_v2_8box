import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/core/constants/images.dart';

class WidgetCustomAppbar extends StatelessWidget {
  final String? title;
  final Widget? assets;
  final Color color;
  final Color textColor;
  final double fontSize;
  final bool isbold;
  final bool isBack;

  const WidgetCustomAppbar({
    super.key,
    this.title,
    this.assets,
    this.textColor = Palette.black,
    this.color = const Color(0xFF1B1C2B),
    this.fontSize = 16,
    this.isbold = false,
    this.isBack = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30, bottom: 20, left: 10, right: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(22)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (isBack != false)
                GestureDetector(
                  onTap: () => Get.offAllNamed('/sponsors'),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Palette.white,
                    size: 18,
                  ),
                ),
              assets ??
                  (title != null
                      ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: WidgetText(
                          title: title!,
                          color: textColor,
                          size: fontSize,
                          isBold: isbold,
                        ),
                      )
                      : const SizedBox()),
            ],
          ),
          Builder(
            builder:
                (context) => GestureDetector(
                  onTap: () => Scaffold.of(context).openEndDrawer(),
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Images.postImg,
                        const Gap(5),
                        const Icon(Icons.menu),
                      ],
                    ),
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
