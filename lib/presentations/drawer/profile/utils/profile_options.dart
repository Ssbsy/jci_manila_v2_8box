import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/presentations/drawer/profile/utils/pages_widget/annual_dues_page_widget.dart';
import 'package:jci_manila_v2/presentations/drawer/profile/utils/pages_widget/basic_info_page_widget.dart';
import 'package:jci_manila_v2/presentations/drawer/profile/utils/pages_widget/gmm_page_widget.dart';
import 'package:jci_manila_v2/presentations/drawer/profile/utils/pages_widget/journey_page_widget.dart';
import 'package:jci_manila_v2/presentations/drawer/profile/utils/pages_widget/projects_page_widget.dart';

class ProfileOptions extends StatefulWidget {
  final ValueChanged<int>? onTabChanged;
  const ProfileOptions({super.key, this.onTabChanged});

  @override
  State<ProfileOptions> createState() => _ProfileOptionsState();
}

class _ProfileOptionsState extends State<ProfileOptions> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    BasicInfoPageWidget(),
    JourneyPageWidget(),
    GmmPageWidget(),
    ProjectsPageWidget(),
    AnnualDuesPageWidget(),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 5,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _container(context, 'Basic Info', Icons.info_outline, index: 0),
                _container(context, 'Journey', Icons.timeline, index: 1),
                _container(context, 'GMM', Icons.event_available, index: 2),
                _container(context, 'Projects', Icons.info_outline, index: 3),
                _container(context, 'Annual Dues', Icons.payment, index: 4),
              ],
            ),
          ),
          IndexedStack(index: currentIndex, children: pages),
        ],
      ),
    );
  }

  Widget _container(
    BuildContext context,
    String title,
    IconData iconData, {
    required int index,
  }) {
    final isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () {
        if (currentIndex == index) return;
        setState(() => currentIndex = index);
        widget.onTabChanged?.call(index);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        width: MediaQuery.of(context).size.width * 0.25,
        decoration: BoxDecoration(
          color: isSelected ? Palette.primary : Palette.transparent,
          border:
              isSelected ? null : Border.all(width: 0.5, color: Palette.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData, color: isSelected ? Palette.white : Palette.black),
            WidgetText(
              title: title,
              color: isSelected ? Palette.white : Palette.black,
            ),
          ],
        ),
      ),
    );
  }
}
