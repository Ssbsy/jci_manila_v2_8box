import 'package:flutter/material.dart';

class PlayerStatsTable extends StatelessWidget {
  final String teamName;

  final List<Map<String, dynamic>> players;

  const PlayerStatsTable({
    super.key,
    required this.teamName,
    required this.players,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(),
          const SizedBox(height: 12),
          _buildHeaderRow(),
          ...players.map((player) => _buildPlayerRow(player)),
        ],
      ),
    );
  }

  Widget _buildHeaderRow() {
    return const Row(
      children: [
        Expanded(
          flex: 4,
          child: Text("Player", style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        Expanded(
          child: Center(
            child: Text("Min", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
        Expanded(
          child: Center(
            child: Text("Reb", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
        Expanded(
          child: Center(
            child: Text("Ast", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
        Expanded(
          child: Center(
            child: Text("Pts", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }

  Widget _buildPlayerRow(Map<String, dynamic> player) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black),
                children: [
                  TextSpan(text: "${player['number']} ${player['name']} "),
                  TextSpan(
                    text: player['position'] ?? '',
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: Center(child: Text("${player['min']}"))),
          Expanded(child: Center(child: Text("${player['reb']}"))),
          Expanded(child: Center(child: Text("${player['ast']}"))),
          Expanded(child: Center(child: Text("${player['pts']}"))),
        ],
      ),
    );
  }
}
