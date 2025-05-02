import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
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
    return Column(children: [_content(context)]);
  }

  Padding _content(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          spacing: 5,
          children: [
            ExploreAssets.myEventImg01,
            Expanded(
              child: Column(
                spacing: 2,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  WidgetText(
                    title: 'Gabi ng Pangaral 2025',
                    isBold: true,
                    size: 1,
                  ),
                  WidgetText(
                    title: Texts.myEventSub,
                    color: Colors.grey.shade700,
                  ),
                  const Gap(5),
                  _rowDescription(
                    Icon(Icons.calendar_today, color: Colors.grey, size: 17),
                    Texts.description01,
                  ),
                  _rowDescription(
                    Icon(Icons.skip_previous, color: Colors.grey, size: 17),
                    Texts.description01,
                  ),
                  _rowDescription(
                    Icon(FontAwesomeIcons.ticket, color: Colors.grey, size: 17),
                    Texts.description01,
                  ),
                  _rowDescription(
                    Icon(Icons.group, color: Colors.blue, size: 17),
                    'Registered Memebers',
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _rowDescription(Icon icon, String title, {Color color = Colors.grey}) {
    return Row(
      spacing: 5,
      children: [icon, WidgetText(title: title, color: color)],
    );
  }
}
