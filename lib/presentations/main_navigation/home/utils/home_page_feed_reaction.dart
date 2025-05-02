import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePageFeedReaction extends StatelessWidget {
  const HomePageFeedReaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 15,
            children: [
              Icon(Icons.favorite, color: Colors.red),
              Icon(FontAwesomeIcons.comment, size: 22),
            ],
          ),
          Row(
            children: [
              Text('Liked by '),
              Text('8 others', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}
