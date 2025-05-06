import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';

class ProjectAppbar extends StatelessWidget {
  const ProjectAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Palette.veryDarkBluishGray),
      child: Row(
        spacing: 15,
        children: [
          GestureDetector(
            onTap: () => Get.offAllNamed('/projects'),
            child: Icon(Icons.arrow_back_ios, color: Palette.white, size: 16),
          ),
          WidgetText(title: 'Project Details', color: Palette.white, size: 14),
        ],
      ),
    );
  }
}
