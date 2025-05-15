import 'package:flutter/material.dart';
import 'package:jci_manila_v2/core/base_api/base_api.dart';
import 'package:jci_manila_v2/core/services/benefits/add_user_benefits_services.dart';

class AddUserBenefitsProvider extends ChangeNotifier {
  final AddUserBenefitsServices userBenefits = AddUserBenefitsServices(
    BaseApiServices(),
  );

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<Map<String, dynamic>> addBenefits({
    required int benefitID,
    required int userID,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await userBenefits.addBenefits(
        benefitID: benefitID,
        userID: userID,
      );
      debugPrint("Add User Benefits response: $response");

      return response;
    } catch (e) {
      debugPrint('Error in Add User Benefits: $e');
      return {"success": false, "message": "An error occurred: $e"};
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
