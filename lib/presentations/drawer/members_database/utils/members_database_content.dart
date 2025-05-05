import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/core/constants/images.dart';
import 'package:jci_manila_v2/core/models/members_database_model.dart';

class MembersDatabaseContent extends StatelessWidget {
  final MembersDatabaseModel database;
  const MembersDatabaseContent({super.key, required this.database});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.shade100,
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Palette.white),
              padding: const EdgeInsets.all(7),
              child: Row(
                spacing: 15,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Images.seanPatrickPng,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _row('First Name: ', database.firstName),
                      _row('Last Name: ', database.lastName),
                    ],
                  ),
                  database.badge,
                ],
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    WidgetText(title: 'Type: '),
                    WidgetText(
                      title: database.type,
                      color: Palette.neutralGray,
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.blue,
                  ),
                  child: WidgetText(
                    title: 'Show Details',
                    color: Palette.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row _row(String title, String subtitle) {
    return Row(
      children: [
        WidgetText(title: title),
        WidgetText(title: subtitle, color: Palette.neutralGray),
      ],
    );
  }
}
