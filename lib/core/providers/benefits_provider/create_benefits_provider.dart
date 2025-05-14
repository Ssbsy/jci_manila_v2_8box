import 'package:flutter/material.dart';
import 'package:jci_manila_v2/core/base_api/base_api.dart';
import 'package:jci_manila_v2/core/services/benefits/create_benefits_services.dart';

class CreateBenefitsProvider extends ChangeNotifier {
  final CreateBenefitsServices create = CreateBenefitsServices(
    BaseApiServices(),
  );

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<Map<String, dynamic>> addBenefits({
    required String image,
    required String name,
    required String description,
    required String percentage,
    required String type,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await create.createBenefit(
        image: image,
        name: name,
        description: description,
        percentage: percentage,
        type: type,
      );
      debugPrint("Create Benefits response: $response");

      return response;
    } catch (e) {
      debugPrint('Error in Create Benefits: $e');
      return {"success": false, "message": "An error occurred: $e"};
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
