import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/app/components/widget_custom_appbar.dart';
import 'package:jci_manila_v2/app/components/widget_drawer.dart';
import 'package:jci_manila_v2/app/components/widget_fab.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/core/constants/fab_controller.dart';
import 'package:jci_manila_v2/presentations/drawer/business_directory/widgets/add_business_form.dart';
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

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (currentIndex == 1) {
        FABController.showFAB.value = true;
        FABController.fabDesignType.value = FABDesignType.altFab;
      } else {
        FABController.showFAB.value = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Scaffold(
        endDrawer: WidgetDrawer(),
        floatingActionButton:
            currentIndex == 1
                ? WidgetFab(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AddBusinessForm(),
                      ),
                    );
                  },
                )
                : null,
        body: Column(
          children: [
            const WidgetCustomAppbar(
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
            Expanded(child: pages[currentIndex]),
          ],
        ),
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
      onTap:
          () => setState(() {
            currentIndex = index;
            FABController.showFAB.value = (index == 1);
            FABController.fabDesignType.value =
                (index == 1) ? FABDesignType.altFab : FABDesignType.defaultFab;
          }),
      child: Column(
        children: [
          WidgetText(
            title: title,
            isBold: true,
            color: isSelected ? Colors.blueAccent : Colors.black,
            size: size,
          ),
          const Gap(5),
          Container(
            height: 2,
            width: MediaQuery.of(context).size.width * 0.5,
            color: isSelected ? Colors.blueAccent : Colors.transparent,
          ),
        ],
      ),
    );
  }
}
