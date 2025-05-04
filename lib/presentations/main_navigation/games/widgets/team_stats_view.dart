import 'package:flutter/material.dart';

class TeamStatsView extends StatelessWidget {
  final String team1Logo;
  final String team2Logo;
  final Map<String, List<String>> stats;

  const TeamStatsView({
    super.key,
    required this.team1Logo,
    required this.team2Logo,
    required this.stats,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(team1Logo, height: 40),
            const Text(
              "Team Stats",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Image.asset(team2Logo, height: 40),
          ],
        ),
        const SizedBox(height: 20),
        ...stats.entries.map((entry) {
          final label = entry.key;
          final values = entry.value;

          if (label == "Total Rebounds") {
            return Column(
              children: [
                const Divider(
                  thickness: 1,
                  color: Color(0xFFEAEAEA),
                  height: 24,
                ),
                _buildStatRow(label, values[0], values[1]),
              ],
            );
          }

          return _buildStatRow(label, values[0], values[1]);
        }),
      ],
    );
  }

  Widget _buildStatRow(String label, String val1, String val2) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(val1),
          Text(label, style: const TextStyle(color: Colors.black)),
          Text(val2),
        ],
      ),
    );
  }
}
