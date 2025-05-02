import 'package:flutter/material.dart';
import 'package:jci_manila_v2/presentations/main_navigation/home/const/assets.dart';

class HomePageFeedHeader extends StatelessWidget {
  const HomePageFeedHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 10,
                children: [
                  Assets.earlHuelPng,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Earl Huel',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('1 min', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
              Icon(Icons.more_horiz),
            ],
          ),
        ],
      ),
    );
  }
}
