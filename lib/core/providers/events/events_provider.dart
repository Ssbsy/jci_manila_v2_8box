import 'package:flutter/material.dart';
import 'package:jci_manila_v2/core/base_api/base_api.dart';
import 'package:jci_manila_v2/core/services/events/all_events_services.dart';

class EventsProvider extends ChangeNotifier {
  final AllEventsService events = AllEventsService(BaseApiServices());

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  bool _hasFetched = false;

  List<Map<String, dynamic>> _homeEvents = [];
  List<Map<String, dynamic>> get homeEvents => _homeEvents;

  Future<void> getHomeEvents() async {
    if (_hasFetched) return;
    _hasFetched = true;

    _isLoading = true;
    notifyListeners();

    try {
      final response = await events.getAllEvents();

      if (response['success'] == true && response['data'] is List) {
        _homeEvents = List<Map<String, dynamic>>.from(response['data']);
      } else {
        _homeEvents = [];
        debugPrint('Unexpected data format: ${response['message']}');
      }
    } catch (e) {
      _homeEvents = [];
      debugPrint('Error in getHomeEvents: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
