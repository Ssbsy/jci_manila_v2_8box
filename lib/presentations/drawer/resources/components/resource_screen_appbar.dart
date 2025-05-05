import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';

class ResourceScreenAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  const ResourceScreenAppbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: WidgetText(title: title, color: Palette.white, size: 18),
      centerTitle: false,
      backgroundColor: Palette.veryDarkBluishGray,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Palette.white, size: 15),
        onPressed: () => Get.offAllNamed('/resources'),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
