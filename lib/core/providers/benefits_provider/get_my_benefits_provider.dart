import 'package:flutter/material.dart';
import 'package:jci_manila_v2/core/services/benefits/get_my_benefits_services.dart';

class GetMyBenefitsProvider extends ChangeNotifier {
  final GetMyBenefitsServices benefitsService;

  GetMyBenefitsProvider(this.benefitsService);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<Map<String, dynamic>> myBenefit() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await benefitsService.getMyBenefits();
      debugPrint("Get My Benefits response: $response");

      return Map<String, dynamic>.from(response);
    } catch (e) {
      debugPrint('Error in myBenefit: $e');
      return {"success": false, "message": "An error occurred: $e"};
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
