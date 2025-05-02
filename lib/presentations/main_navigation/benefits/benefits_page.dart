import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/app/components/widget_custom_appbar.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_search_bar.dart';
import 'package:jci_manila_v2/presentations/main_navigation/benefits/utils/benefits_page_content.dart';

class BenefitsPage extends StatefulWidget {
  const BenefitsPage({super.key});

  @override
  State<BenefitsPage> createState() => _BenefitsPageState();
}

class _BenefitsPageState extends State<BenefitsPage> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          WidgetCustomAppbar(
            title: 'Benefits',
            textColor: Palette.white,
            fontSize: 20,
            isbold: true,
          ),
          const Gap(15),
          WidgetSearchBar(controller: searchController),
          const Gap(15),
          BenefitsPageContent(),
        ],
      ),
    );
  }
}
