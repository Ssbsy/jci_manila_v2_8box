import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/app/components/widget_custom_appbar.dart';
import 'package:jci_manila_v2/app/components/widget_drawer.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/presentations/drawer/business_directory/utils/business_pageview.dart';
import 'package:jci_manila_v2/presentations/drawer/business_directory/utils/my_business_pageview.dart';

class BusinessDirectoryScreen extends StatefulWidget {
  final int initialPage;
  const BusinessDirectoryScreen({super.key, this.initialPage = 0});

  @override
  State<BusinessDirectoryScreen> createState() =>
      _BusinessDirectoryScreenState();
}

class _BusinessDirectoryScreenState extends State<BusinessDirectoryScreen> {
  late int currentIndex;

  final List<Widget> pages = [BusinessPageview(), MyBusinessPageview()];

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialPage;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Scaffold(
        body: Column(
          children: [
            WidgetCustomAppbar(
              title: 'Business Directory',
              textColor: Colors.white,
              isbold: true,
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTab(title: 'Business', index: 0),
                _buildTab(title: 'My Business', index: 1),
              ],
            ),
            pages[currentIndex],
          ],
        ),
        endDrawer: WidgetDrawer(),
      ),
    );
  }

  Widget _buildTab({
    required String title,
    required int index,
    double size = 16,
  }) {
    final isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () => setState(() => currentIndex = index),
      child: Column(
        children: [
          WidgetText(
            title: title,
            isBold: true,
            color: isSelected ? Colors.blue : Colors.black,
            size: size,
          ),
          const Gap(5),
          Container(
            height: 2,
            width: MediaQuery.of(context).size.width * 0.5,
            color: isSelected ? Colors.blue : Colors.transparent,
          ),
        ],
      ),
    );
  }
}
