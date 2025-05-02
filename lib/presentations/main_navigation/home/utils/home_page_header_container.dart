import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/presentations/main_navigation/home/const/assets.dart';

class HomePageHeaderContainer extends StatelessWidget {
  const HomePageHeaderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 5,
                children: [
                  Text(
                    'Hi,',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Eikon',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFFE9A101),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              Text('2021-031'),

              const Gap(5),

              Row(
                spacing: 5,
                children: [
                  _logo(Assets.jciBlackLogo, Colors.amber),
                  _logo(
                    Icon(Icons.check, color: Colors.white, size: 15),
                    Colors.lightGreen,
                  ),
                ],
              ),
            ],
          ),

          Assets.qrCodePng,
        ],
      ),
    );
  }

  Container _logo(Widget asset, Color color, {Icon? icon}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: asset ?? icon ?? const SizedBox.shrink(),
    );
  }
}
