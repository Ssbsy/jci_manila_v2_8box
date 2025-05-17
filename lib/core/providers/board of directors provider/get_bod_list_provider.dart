import 'package:flutter/material.dart';
import 'package:jci_manila_v2/core/base_api/base_api.dart';
import 'package:jci_manila_v2/core/services/board%20of%20directors/get_bod_list_services.dart';

class GetBodListProvider extends ChangeNotifier {
  final GetBodListServices getBodList = GetBodListServices(BaseApiServices());

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  bool _hasFetched = false;

  List<Map<String, dynamic>> _bodList = [];
  List<Map<String, dynamic>> get bodList => _bodList;

  Future<void> getHomeEvents() async {
    if (_hasFetched) return;
    _hasFetched = true;

    _isLoading = true;
    notifyListeners();

    try {
      final response = await getBodList.getBodList();

      if (response['success'] == true && response['data'] is List) {
        _bodList = List<Map<String, dynamic>>.from(response['data']);
      } else {
        _bodList = [];
        debugPrint('Unexpected data format: ${response['message']}');
      }
    } catch (e) {
      _bodList = [];
      debugPrint('Error in getHomeEvents: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
