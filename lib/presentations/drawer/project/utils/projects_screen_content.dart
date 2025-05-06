import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';

class ProjectsScreenContent extends StatelessWidget {
  const ProjectsScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Flexible(
                flex: 2,
                fit: FlexFit.loose,
                child: WidgetText(title: 'Project Title', isBold: true),
              ),
              const Gap(70),
              Flexible(
                flex: 1,
                fit: FlexFit.loose,
                child: WidgetText(title: 'BOD Status', isBold: true),
              ),
              Spacer(),
            ],
          ),
          const Gap(10),
          _content("University of Leaders Orientation (ULO5)", "For Approval"),
          const Gap(10),
          _content("Gabi ng Parangal 2025: Hall of Fame)", "For Approval"),
        ],
      ),
    );
  }

  static Widget _content(String projectTitle, String status) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 2,
            fit: FlexFit.loose,
            child: WidgetText(title: projectTitle, maxLine: 3, size: 10),
          ),
          const Gap(10),
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: WidgetText(
              title: status,
              color: Colors.yellow.shade700,
              size: 10,
            ),
          ),
          const Gap(10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _icon(Icon(Icons.edit_outlined, size: 18)),
              const Gap(5),
              _icon(
                Icon(Icons.visibility_outlined, size: 18, color: Palette.white),
                color: Colors.blue.shade700,
                onTap: () => Get.offAllNamed('/projectDetails'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static Widget _icon(Icon icon, {Color? color, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade700),
          borderRadius: BorderRadius.circular(12),
          color: color,
        ),
        child: icon,
      ),
    );
  }
}
