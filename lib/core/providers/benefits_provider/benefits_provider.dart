import 'package:flutter/material.dart';
import 'package:jci_manila_v2/core/base_api/base_api.dart';
import 'package:jci_manila_v2/core/services/benefits/get_all_benefits_services.dart';

class BenefitsProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _benefitList = [];
  bool _isLoading = true;

  List<Map<String, dynamic>> get benefits => _benefitList;
  bool get isLoading => _isLoading;

  Future<void> fetchBenefits() async {
    _isLoading = true;
    notifyListeners();

    final response =
        await GetAllBenefitsServices(BaseApiServices()).getAllBenefits();

    //sucess - to match API response
    if (response['sucess'] == true && response['data'] != null) {
      _benefitList.clear();
      for (final benefit in response['data']) {
        _benefitList.add({
          'id': benefit['id'],
          'image': benefit['image'],
          'title': benefit['name'],
          'description': benefit['description'],
          'discount': (benefit['percentage'] ?? 0) * 100,
          'category': benefit['type'],
        });
      }
    }

    _isLoading = false;
    notifyListeners();
  }
}
