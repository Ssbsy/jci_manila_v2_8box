import 'package:flutter/material.dart';
import 'package:jci_manila_v2/core/base_api/base_api.dart';
import 'package:jci_manila_v2/core/services/profile/patch_settings_services.dart';

class PatchSettingsProvider extends ChangeNotifier {
  final PatchSettingsServices settings = PatchSettingsServices(
    BaseApiServices(),
  );
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Map<dynamic, dynamic>? _profileData;
  Map<dynamic, dynamic>? get profileData => _profileData;

  Future<void> patchSettings({
    required int showNotif,
    required int showBday,
    required int showPrimaryContactInfo,
    required int showEducationInfo,
    required int showProfessionInfo,
    required int showCivilStatus,
    required int showSecondaryContactInfo,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      final result = await settings.patchSettings(
        showNofif: showNotif,
        showBday: showBday,
        showPrimaryContactInfo: showPrimaryContactInfo,
        showEducationInfo: showEducationInfo,
        showProfessionInfo: showProfessionInfo,
        showCivilStatus: showCivilStatus,
        showSecondaryContactInfo: showSecondaryContactInfo,
      );

      if (result['success'] == true) {
        _profileData = result['data'];
        debugPrint(_profileData?.toString());
      } else {
        _profileData = null;
        debugPrint("Error fetching profile: ${result['message']}");
      }
    } catch (e) {
      _profileData = null;
      debugPrint("Exception occurred: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
