import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/core/constants/images.dart';
import 'package:jci_manila_v2/presentations/main_navigation/home/const/assets.dart';

class WidgetCustomAppbar extends StatelessWidget {
  final String? title;
  final Widget? assets;
  final Color color;
  final Color textColor;
  final double fontSize;
  final bool isbold;

  const WidgetCustomAppbar({
    super.key,
    this.title,
    this.assets,
    this.textColor = Palette.black,
    this.color = const Color(0xFF1B1C2B),
    this.fontSize = 16,
    this.isbold = false,
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
