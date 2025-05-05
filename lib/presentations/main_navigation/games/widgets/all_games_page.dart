import 'package:flutter/material.dart';
import 'package:jci_manila_v2/presentations/main_navigation/games/widgets/game_card_live.dart';
import 'package:jci_manila_v2/presentations/main_navigation/games/widgets/game_card_past.dart';

class AllGamesPage extends StatelessWidget {
  final bool isPastGames;
  final VoidCallback onLiveGameTap;
  final VoidCallback onPastGameTap;

  const AllGamesPage({
    super.key,
    this.isPastGames = false,
    required this.onLiveGameTap,
    required this.onPastGameTap,
  });

  @override
  Widget build(BuildContext context) {
    return isPastGames
        ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GameCardPast(
              imagePath: "assets/images/mlbb.png",
              title: "Golf Tournament 1",
              date: "April 25, 2025",
              onTap: onPastGameTap,
            ),
            GameCardPast(
              imagePath: "assets/images/mlbb.png",
              title: "NBA Showdown 1",
              date: "April 30, 2025",
              onTap: onPastGameTap,
            ),
          ],
        )
        : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GameCardLive(
              imagePath: "assets/images/mlbb.png",
              onTap: onLiveGameTap,
            ),
            const SizedBox(height: 24),
            const Text(
              "Upcoming Live Events",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            GameCardPast(
              imagePath: "assets/images/mlbb.png",
              title: "Golf Tournament 1",
              date: "April 25, 2025",
              onTap: onPastGameTap,
            ),
            GameCardPast(
              imagePath: "assets/images/mlbb.png",
              title: "NBA Showdown 1",
              date: "April 30, 2025",
              onTap: onPastGameTap,
            ),
          ],
        );
  }
}
