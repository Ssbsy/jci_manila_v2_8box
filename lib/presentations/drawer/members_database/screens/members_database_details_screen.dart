import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/core/constants/images.dart';
import 'package:jci_manila_v2/core/models/members_database_model.dart';

class MembersDatabaseDetailsScreen extends StatefulWidget {
  final MembersDatabaseModel database;
  const MembersDatabaseDetailsScreen({super.key, required this.database});

  @override
  State<MembersDatabaseDetailsScreen> createState() =>
      _MembersDatabaseDetailsScreenState();
}

class _MembersDatabaseDetailsScreenState
    extends State<MembersDatabaseDetailsScreen> {
  late Color badgeColor;

  @override
  void initState() {
    super.initState();
    if (widget.database.type == Images.yellowBadge) {
      badgeColor = Colors.yellowAccent;
    } else if (widget.database.type == Images.brownBadge) {
      badgeColor = Color.fromARGB(255, 116, 85, 68);
    } else {
      badgeColor = Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final String fullName =
        widget.database.firstName + widget.database.lastName;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _appBar(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 5,
              ),
              child: Container(
                decoration: BoxDecoration(border: Border.all(width: 1)),
                child: Column(
                  children: [
                    WidgetText(
                      title: widget.database.type,
                      isBold: true,
                      size: 16,
                    ),
                    Container(
                      decoration: BoxDecoration(color: badgeColor),
                      child: Row(
                        children: [
                          Images.seanPatrick02Png,
                          Column(
                            children: [
                              WidgetText(title: fullName),
                              WidgetText(title: 'JCI Manila Member Since 2016'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(color: badgeColor),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _appBar() {
    return Container(
      decoration: BoxDecoration(color: Color(0xFF1B1C2B)),
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Get.offAllNamed('/database'),
            child: Icon(Icons.arrow_back_ios),
          ),
          WidgetText(title: 'Details'),
        ],
      ),
    );
  }
}
