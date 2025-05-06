import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimatedWidgets extends StatelessWidget {
  final bool animate;

  const AnimatedWidgets({super.key, required this.animate});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOut,
          bottom: animate ? Get.height / 15 : -Get.height / 15,
          left: 0,
          right: 0,
          child: Image.asset(
            'assets/images/sponsors_big.png',
            width: Get.width,
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOut,
          top: animate ? Get.height / 4 : -Get.height / 3,
          left: 0,
          right: 0,
          child: Center(
            child: Image.asset('assets/images/jci_manila_logo_white.png'),
          ),
        ),
      ],
    );
  }
}
