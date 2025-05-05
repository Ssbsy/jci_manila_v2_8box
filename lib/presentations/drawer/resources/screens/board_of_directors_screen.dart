import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/presentations/drawer/resources/components/resource_screen_appbar.dart';

class BoardOfDirectorsScreen extends StatefulWidget {
  const BoardOfDirectorsScreen({super.key});

  @override
  State<BoardOfDirectorsScreen> createState() => _BoardOfDirectorsScreenState();
}

class _BoardOfDirectorsScreenState extends State<BoardOfDirectorsScreen> {
  final List<String> items = ['2024', '2023', '2022', '2021', '2020'];
  String selectedYear = '2020';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResourceScreenAppbar(title: 'Board of Directors'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WidgetText(
                  title: selectedYear,
                  isBold: true,
                  size: 22,
                  color: Palette.primary,
                ),
                Row(
                  children: [
                    WidgetText(title: 'Year: ', size: 16),
                    DropdownButton<String>(
                      value: selectedYear,
                      items:
                          items.map((String year) {
                            return DropdownMenuItem<String>(
                              value: year,
                              child: Text(year),
                            );
                          }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            selectedYear = value;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
