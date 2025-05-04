import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/presentations/main_navigation/games/game_detail_live.dart';
import 'package:jci_manila_v2/presentations/main_navigation/games/game_detailed_past.dart';
import 'package:jci_manila_v2/presentations/main_navigation/games/widgets/all_games_page.dart';
import 'package:jci_manila_v2/presentations/main_navigation/games/widgets/basketball_page.dart';
import 'package:jci_manila_v2/presentations/main_navigation/games/widgets/game_filter_chips.dart';
import 'package:jci_manila_v2/presentations/main_navigation/games/widgets/game_search_bar.dart';
import 'package:jci_manila_v2/presentations/main_navigation/games/widgets/games_app_bar.dart';
import 'package:jci_manila_v2/presentations/main_navigation/games/widgets/ml_page.dart';
import 'package:jci_manila_v2/presentations/main_navigation/games/widgets/ryder_clup_page.dart';

class GamesPage extends StatefulWidget {
  const GamesPage({super.key});

  @override
  State<GamesPage> createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> with TickerProviderStateMixin {
  late TabController _tabController;
  String selectedFilter = "All";

  final List<String> filters = ["All", "Ryder Club", "MLBB", "Basketball"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void _openLiveGame() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const GameDetailLive()),
    );
  }

  void _openPastGame() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const GameDetailPast()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.neutralWhite,
      appBar: const GamesAppBar(),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            indicatorColor: Palette.accentBlue,
            labelColor: Palette.neutralBlack,
            unselectedLabelColor: Palette.neutralGray,
            tabs: const [Tab(text: "Games"), Tab(text: "Past Games")],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildContentTab(isPastGames: false),
                _buildContentTab(isPastGames: true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentTab({required bool isPastGames}) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const GameSearchBar(),
        const SizedBox(height: 16),
        GameFilterChips(
          filters: filters,
          selected: selectedFilter,
          onSelected: (val) => setState(() => selectedFilter = val),
        ),
        const SizedBox(height: 24),
        _getContent(isPastGames: isPastGames),
      ],
    );
  }

  Widget _getContent({required bool isPastGames}) {
    switch (selectedFilter) {
      case "Ryder Club":
        return RyderClubPage(
          isPastGames: isPastGames,
          onLiveGameTap: _openLiveGame,
          onPastGameTap: _openPastGame,
        );
      case "MLBB":
        return MLBBPage(
          isPastGames: isPastGames,
          onLiveGameTap: _openLiveGame,
          onPastGameTap: _openPastGame,
        );
      case "Basketball":
        return BasketballPage(
          isPastGames: isPastGames,
          onLiveGameTap: _openLiveGame,
          onPastGameTap: _openPastGame,
        );
      default:
        return AllGamesPage(
          onLiveGameTap: _openLiveGame,
          onPastGameTap: _openPastGame,
        );
    }
  }
}
