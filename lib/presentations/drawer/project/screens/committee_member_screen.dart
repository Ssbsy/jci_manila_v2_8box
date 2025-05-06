import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';

class CommitteeMemberScreen extends StatelessWidget {
  const CommitteeMemberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        spacing: 5,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _col(
            'ID',
            '2020-006',
            "2013-045",
            '2022-001B',
            '272',
            '2019-045',
            '2021-031',
          ),
          _col(
            'Commitee Name',
            "Tee Ten, Wayne",
            'Serrano, Francis Nicole',
            'Banico, Juan Eugenio',
            'Marquez, Monico Ruben',
            'Villaruz, Mark Vincent',
            'Penafiel, Mark Ryan',
          ),
          _col(
            'Member Type',
            "Committee",
            'Committee',
            'Vice-Chairman',
            'Chairman',
            'Commissioner',
            'Committee',
          ),
        ],
      ),
    );
  }

  Widget _col(
    String title,
    String content1,
    String content2,
    String content3,
    String content4,
    String content5,
    String content6,
  ) {
    return Flexible(
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WidgetText(title: title, isBold: true, size: 16),
          WidgetText(title: content1, size: 14),
          WidgetText(title: content2, size: 14),
          WidgetText(title: content3, size: 14),
          WidgetText(title: content4, size: 14),
          WidgetText(title: content5, size: 14),
          WidgetText(title: content6, size: 14),
        ],
      ),
    );
  }
}
