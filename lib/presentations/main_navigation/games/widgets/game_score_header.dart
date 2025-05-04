import 'package:flutter/material.dart';

class GameScoreHeader extends StatelessWidget {
  final String team1Name;
  final String team1Logo;
  final String team1Score;
  final String team1Record;
  final String team2Name;
  final String team2Logo;
  final String team2Score;
  final String team2Record;

  const GameScoreHeader({
    super.key,
    required this.team1Name,
    required this.team1Logo,
    required this.team1Score,
    required this.team1Record,
    required this.team2Name,
    required this.team2Logo,
    required this.team2Score,
    required this.team2Record,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset(team1Logo, height: 60),
                  const SizedBox(height: 6),
                  Text(
                    team1Name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    team1Record,
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        team1Score,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "-",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        team2Score,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Image.asset(team2Logo, height: 60),
                  const SizedBox(height: 6),
                  Text(
                    team2Name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    team2Record,
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
