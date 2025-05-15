import 'package:flutter/material.dart';
import 'package:jci_manila_v2/core/base_api/base_api.dart';
import 'package:jci_manila_v2/core/services/benefits/redeem_benefits_services.dart';

class RedeemBenefitsProvider extends ChangeNotifier {
  final RedeemBenefitsServices redeem = RedeemBenefitsServices(
    BaseApiServices(),
  );

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<Map<String, dynamic>> redeemBenefits({
    required int userBenefitID,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await redeem.redeemBenefits(
        userBenefitID: userBenefitID,
      );
      debugPrint("Redeem benefits response: $response");

      return response;
    } catch (e) {
      debugPrint('Error in Redeem Benefits: $e');
      return {"success": false, "message": "An error occurred: $e"};
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
