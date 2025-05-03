import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/app/widgets/widget_search_bar.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/core/constants/fab_controller.dart';
import 'package:jci_manila_v2/presentations/main_navigation/events/const/explore_assets.dart';
import 'package:jci_manila_v2/presentations/main_navigation/events/const/texts.dart';

class MyEventsPageview extends StatefulWidget {
  const MyEventsPageview({super.key});

  @override
  State<MyEventsPageview> createState() => _MyEventsPageviewState();
}

class _MyEventsPageviewState extends State<MyEventsPageview> {
  final controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FABController.showFAB.value = true;
      FABController.fabDesignType.value = FABDesignType.defaultFab;
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
    return SingleChildScrollView(
      child: Column(
        children: [
          WidgetSearchBar(controller: controller),
          const Gap(10),
          _content(context),
        ],
      ),
    );
  }

  Widget _content(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: Column(children: []),
    );
  }
}
