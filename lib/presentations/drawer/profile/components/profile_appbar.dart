import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';

class ProfileAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Palette.veryDarkBluishGray,
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: Icon(Icons.arrow_back_ios, color: Palette.white),
      ),
      title: WidgetText(title: 'Profile', color: Palette.white),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.edit, color: Palette.white),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
