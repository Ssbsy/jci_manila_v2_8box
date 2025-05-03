import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_image_container.dart';
import 'package:jci_manila_v2/core/constants/font_manager.dart';
import 'package:jci_manila_v2/core/constants/strings.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();

    void onNextPage(BuildContext context) {
      if (pageController.page == 2) {
        Get.offAllNamed('/login');
      } else {
        pageController.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }

    return Stack(
      children: [
        PageView(
          controller: pageController,
          children: [
            buildContainer(
              pageController,
              'Build',
              Onboarding.buildText,
              'assets/images/build.png',
            ),
            buildContainer(
              pageController,
              'Innovate',
              Onboarding.innovateText,
              'assets/images/innovate.png',
            ),
            buildContainer(
              pageController,
              'Grow',
              Onboarding.growText,
              'assets/images/grow.png',
            ),
          ],
        ),
        Positioned(
          bottom: 0,
          left: 8,
          right: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SmoothPageIndicator(
                controller: pageController,
                effect: ExpandingDotsEffect(
                  dotHeight: 8,
                  dotWidth: 12,
                  dotColor: Palette.white,
                  activeDotColor: Palette.white,
                ),
                count: 3,
              ),
              IconButton.filled(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Palette.white),
                  iconColor: WidgetStatePropertyAll(Palette.black),
                ),
                onPressed: () => onNextPage(context),
                icon: Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildContainer(
    PageController pageController,
    String title,
    String desc,
    String imageAsset,
  ) {
    return WidgetImageContainer(
      imageAsset: imageAsset,
      alpha: 0.5,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(bottom: 50, left: 12, right: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: FontManager.bigWhiteBold),
              Text(desc, style: FontManager.normalWhiteMedium),
            ],
          ),
        ),
      ),
    );
  }
}
