import 'package:flutter/material.dart';
import 'package:jci_manila_v2/presentations/main_navigation/games/widgets/game_card_live.dart';
import 'package:jci_manila_v2/presentations/main_navigation/games/widgets/game_card_past.dart';

class RyderClubPage extends StatelessWidget {
  final bool isPastGames;
  final VoidCallback onLiveGameTap;
  final VoidCallback onPastGameTap;

  const RyderClubPage({
    super.key,
    this.isPastGames = false,
    required this.onLiveGameTap,
    required this.onPastGameTap,
  });

  @override
  Widget build(BuildContext context) {
    return isPastGames
        ? Column(
          children: [
            GameCardPast(
              imagePath: "assets/images/mlbb.png",
              title: "Ryder Club Championship",
              date: "March 15, 2025",
              onTap: onPastGameTap,
            ),
            GameCardPast(
              imagePath: "assets/images/mlbb.png",
              title: "Annual Golf Tournament",
              date: "February 28, 2025",
              onTap: onPastGameTap,
            ),
          ],
        )
        : Column(
          children: [
            GameCardLive(
              imagePath: "assets/images/mlbb.png",
              onTap: onLiveGameTap,
            ),
            const SizedBox(height: 16),
            GameCardPast(
              imagePath: "assets/images/mlbb.png",
              title: "Upcoming Ryder Event",
              date: "May 15, 2025",
              onTap: onLiveGameTap,
            ),
          ],
        );
  }
}
