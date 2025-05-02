import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/core/constants/fab_controller.dart';

class WidgetFab extends StatelessWidget {
  final VoidCallback onPressed;

  const WidgetFab({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: FABController.showFAB,
      builder: (context, show, _) {
        if (!show) return const SizedBox.shrink();

        return ValueListenableBuilder<FABDesignType>(
          valueListenable: FABController.fabDesignType,
          builder: (context, design, _) {
            switch (design) {
              case FABDesignType.altFab:
                return FloatingActionButton(
                  onPressed: onPressed,
                  backgroundColor: Colors.black87,
                  child: const Icon(
                    Icons.add_box_outlined,
                    color: Colors.white,
                  ),
                );

              case FABDesignType.defaultFab:
              default:
                return FloatingActionButton(
                  onPressed: onPressed,
                  child: Icon(Icons.add, color: Palette.white),
                );
            }
          },
        );
      },
    );
  }
}
