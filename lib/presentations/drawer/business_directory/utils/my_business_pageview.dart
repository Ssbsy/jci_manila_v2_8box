import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/app/widgets/widget_dropdown.dart';
import 'package:jci_manila_v2/app/widgets/widget_search_bar.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';

class MyBusinessPageview extends StatefulWidget {
  const MyBusinessPageview({super.key});

  @override
  State<MyBusinessPageview> createState() => _MyBusinessPageviewState();
}

class _MyBusinessPageviewState extends State<MyBusinessPageview> {
  final controller = TextEditingController();
  String? selectedCategory;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WidgetSearchBar(controller: controller),
          const Gap(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: WidgetText(title: 'Category', isBold: true, size: 16),
          ),
          const Gap(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: WidgetDropdown(
              items: ['Food', 'Merchandise', 'Service'],
              selectedItem: selectedCategory,
              onChanged: (value) {
                setState(() {
                  selectedCategory = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
