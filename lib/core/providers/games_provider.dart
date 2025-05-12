import 'package:flutter/material.dart';
import 'package:jci_manila_v2/core/base_api/base_api.dart';
import 'package:jci_manila_v2/core/services/games/get_games_services.dart';

class GamesProvider extends ChangeNotifier {
  final GetGamesServices gameService = GetGamesServices(BaseApiServices());

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Map<String, dynamic>? _gameData;
  Map<String, dynamic>? get gameData => _gameData;

  Future<String?> getGames() async {}
}
