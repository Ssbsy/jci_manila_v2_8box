import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/app/components/widget_custom_appbar.dart';
import 'package:jci_manila_v2/core/constants/fab_controller.dart';
import 'package:jci_manila_v2/presentations/main_navigation/home/const/assets.dart';
import 'package:jci_manila_v2/presentations/main_navigation/home/utils/home_page_autochanging_tile.dart';
import 'package:jci_manila_v2/presentations/main_navigation/home/utils/home_page_feed.dart';
import 'package:jci_manila_v2/presentations/main_navigation/home/utils/home_page_header_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SingleChildScrollView _body() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.dashboardBackgroundImg),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              spacing: 20,
              children: [
                WidgetCustomAppbar(assets: Assets.jciManilaLogoWhite1),
                HomePageHeaderContainer(),
                HomePageAutochangingTile(),
              ],
            ),
          ),
          const Gap(20),
          HomePageFeed(feed: feed,),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FABController.showFAB.value = true;
      FABController.fabDesignType.value = FABDesignType.altFab;
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FABController.showFAB.value = false;
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _body();
  }
}
