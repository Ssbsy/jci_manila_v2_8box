import 'package:flutter/material.dart';
import 'package:jci_manila_v2/core/base_api/base_api.dart';
import 'package:jci_manila_v2/core/services/accounts/profile/get_profile_annual_dues_services.dart';

class GetProfileAnnualDuesProvider extends ChangeNotifier {
  final GetProfileAnnualDuesServices profileGmm = GetProfileAnnualDuesServices(
    BaseApiServices(),
  );
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Map<dynamic, dynamic>? _profileData;
  Map<dynamic, dynamic>? get profileData => _profileData;

  Future<void> fetchProfileAnnualDues() async {
    _isLoading = true;
    notifyListeners();

    try {
      final result = await profileGmm.getAnnualDues();
      if (result['success'] == true) {
        _profileData = result['data'];
      } else {
        _profileData = null;
        debugPrint("Error fetching profile: ${result['message']}");
      }
    } catch (e) {
      _profileData = null;
      debugPrint("Exception occured: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
