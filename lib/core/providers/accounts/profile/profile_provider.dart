import 'package:flutter/material.dart';
import 'package:jci_manila_v2/core/base_api/base_api.dart';
import 'package:jci_manila_v2/core/models/user_profile.dart';
import 'package:jci_manila_v2/core/services/accounts/profile/get_profile_services.dart';

class ProfileProvider with ChangeNotifier {
  Map<dynamic, dynamic>? profileData;
  UserProfile? _user;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  UserProfile? get user => _user;

  Future<void> fetchProfile() async {
    try {
      _isLoading = true;
      notifyListeners();

      final apiService = BaseApiServices();
      final profileService = GetProfileServices(apiService);
      final data = await profileService.getProfile();

      if (data['success'] == true && data['data'] != null) {
        _user = UserProfile.fromJson(data['data']);
      }

      debugPrint("Profile data fetched: $data");
      debugPrint('Profile API keys: ${data.keys.toList()}');

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      debugPrint("Error fetching profile: $e");
      _isLoading = false;
      notifyListeners();
    }
  }
}
