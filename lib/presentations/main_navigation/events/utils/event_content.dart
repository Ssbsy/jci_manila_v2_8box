import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/presentations/main_navigation/events/const/explore_assets.dart';

class EventContent extends StatelessWidget {
  const EventContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExploreAssets.exploreContent01,
            WidgetText(
              title: 'Lorem ipsum dolor sit amet consectetur',
              isBold: true,
            ),
            WidgetText(
              title:
                  'Lorem ipsum dolor sit amet consectetur. Elit fringilla aliquam ultricies pellentesque augue posuere. Volutpat at sed viverra adipiscing massa eu sit elit senectus. ',
              isJustified: true,
            ),
            _row(
              Icon(Icons.location_on, color: Colors.blue, size: 20),
              'Lorem ipsum dolor sit amet consectetur',
            ),
            _row(
              Icon(Icons.access_time_filled, color: Colors.blue, size: 18),
              '10:00AM - 6:00PM',
            ),
          ],
        ),
      ),
    );
  }

  Row _row(Icon icon, String title) {
    return Row(spacing: 10, children: [icon, WidgetText(title: title)]);
  }
}
