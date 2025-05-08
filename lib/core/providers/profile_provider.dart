import 'package:flutter/material.dart';
import 'package:jci_manila_v2/core/base_api/base_api.dart';
import 'package:jci_manila_v2/core/services/accounts/get_profile_services.dart';

class ProfileProvider with ChangeNotifier {
  String _firstName = '';
  String _lastName = '';
  String _middleName = '';
  bool _isLoading = true;

  String _homeAddress = '';
  String _city = '';
  String _contact = '';

  String get firstName => _firstName;
  String get lastName => _lastName;
  String get middleName => _middleName;
  bool get isLoading => _isLoading;

  String get homeAddress => _homeAddress;
  String get city => _city;
  String get contact => _contact;

  int _freeGmmCount = 0;
  int _memberPoints = 0;
  int _projectsCount = 0;

  String _qrData = '';

  Map<dynamic, dynamic>? profileData;

  int get freeGmmCount => _freeGmmCount;
  int get memberPoints => _memberPoints;
  int get projectsCount => _projectsCount;

  String get qrData => _qrData;

  Future<void> fetchProfile() async {
    try {
      _isLoading = true;
      notifyListeners();

      final apiService = BaseApiServices();
      final profileService = GetProfileServices(apiService);
      final data = await profileService.getProfile();

      _firstName = data['first_name'] ?? '';
      _lastName = data['last_name'] ?? '';
      _middleName = data['middle_name'] ?? '';
      profileData = data;

      _qrData = data['qr_data'] ?? '';

      _freeGmmCount = data['free_gmm'] ?? 0;
      _memberPoints = data['membership_benefits'] ?? 0;
      _projectsCount = data['projects_count'] ?? 0;

      _homeAddress = data['home_address'] ?? '';
      _city = data['home_city'] ?? '';
      _contact = data['contact_number'] ?? '';

      debugPrint("Profile data fetched: $data");

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      debugPrint("Error fetching profile: $e");
      _isLoading = false;
      notifyListeners();
    }
  }
}
