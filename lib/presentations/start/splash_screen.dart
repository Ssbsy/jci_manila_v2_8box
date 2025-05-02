import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jci_manila_v2/app/animation/animated_widgets.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_image_container.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _animate = false;
  Future? _navigationFuture;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          _animate = true;
        });
      }
    });

    _navigationFuture = Future.delayed(Duration(seconds: 4), () {
      Get.offAllNamed('/onboarding');
    });
  }

  @override
  void dispose() {
    _navigationFuture?.ignore();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WidgetImageContainer(
      alpha: 0.3,
      imageAsset: 'assets/images/splash_background.jpg',
      child: Scaffold(
        backgroundColor: Palette.transparent,
        body: AnimatedWidgets(animate: _animate),
      ),
    );
  }
}
