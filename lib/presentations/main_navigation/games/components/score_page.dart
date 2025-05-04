import 'package:flutter/material.dart';
import 'package:jci_manila_v2/presentations/main_navigation/games/widgets/game_score_header.dart';
import 'package:jci_manila_v2/presentations/main_navigation/games/widgets/player_stats_table.dart';
import 'package:jci_manila_v2/presentations/main_navigation/games/widgets/quarter_score_table.dart';
import 'package:jci_manila_v2/presentations/main_navigation/games/widgets/team_stats_view.dart';

class ScorePage extends StatefulWidget {
  final List<Map<String, dynamic>> team1Players;
  final List<Map<String, dynamic>> team2Players;

  const ScorePage({
    super.key,
    required this.team1Players,
    required this.team2Players,
  });

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage>
    with SingleTickerProviderStateMixin {
  late TabController _innerTabController;

  @override
  void initState() {
    super.initState();
    _innerTabController = TabController(length: 3, vsync: this);
    _innerTabController.addListener(() {
      setState(() {}); // Rebuild on tab switch
    });
  }

  @override
  void dispose() {
    _innerTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: GameScoreHeader(
            team1Name: "Los Angeles Lakers",
            team1Score: "125",
            team1Logo: "assets/images/mlbb.png",
            team1Record: "(42 - 25)",
            team2Name: "San Antonio Spurs",
            team2Score: "109",
            team2Logo: "assets/images/mlbb.png",
            team2Record: "(28 - 39)",
          ),
        ),
        const Divider(color: Color.fromARGB(255, 238, 236, 236)),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: QuarterScoreTable(),
        ),
        const SizedBox(height: 12),
        TabBar(
          controller: _innerTabController,
          indicatorColor: const Color(0xFF0066CC),
          labelColor: const Color(0xFF0066CC),
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(text: "Lakers"),
            Tab(text: "Spurs"),
            Tab(text: "Stats"),
          ],
        ),
        const Divider(height: 0),

        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: _buildTabContent(_innerTabController.index),
          ),
        ),
      ],
    );
  }

  Widget _buildTabContent(int index) {
    switch (index) {
      case 0:
        return PlayerStatsTable(
          teamName: "Los Angeles Lakers",
          players: widget.team1Players,
        );
      case 1:
        return PlayerStatsTable(
          teamName: "San Antonio Spurs",
          players: widget.team2Players,
        );
      case 2:
        return const TeamStatsView(
          team1Logo: "assets/images/mlbb.png",
          team2Logo: "assets/images/mlbb.png",
          stats: {
            "Field goals": ["44/90", "41/88"],
            "Field goal %": ["48.9", "46.6"],
            "3 pointers": ["19/48", "15/38"],
            "Three point %": ["39.6", "39.5"],
            "Free throws": ["18/24", "12/14"],
            "Free throw %": ["75.0", "85.7"],
            "Total Rebounds": ["42", "44"],
            "Offensive Rebounds": ["8", "9"],
            "Defensive Rebounds": ["34", "35"],
            "Assists": ["34", "30"],
            "Blocks": ["4", "5"],
            "Steals": ["13", "6"],
            "Turnovers": ["9", "17"],
            "Points in the paint": ["48", "48"],
            "Fouls - Personal": ["10", "18"],
          },
        );
      default:
        return const SizedBox();
    }
  }
}
