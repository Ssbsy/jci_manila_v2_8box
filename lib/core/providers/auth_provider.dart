import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jci_manila_v2/core/base_api/base_api.dart';
import 'package:jci_manila_v2/core/services/accounts/login_services.dart';
import 'package:jci_manila_v2/core/services/accounts/login_verification_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  final LoginServices _authRepository = LoginServices(BaseApiServices());
  final LoginVerificationServices _authVerification = LoginVerificationServices(
    BaseApiServices(),
  );

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Map<String, dynamic>? _userData;
  Map<String, dynamic>? get userData => _userData;

  Future<String?> login({
    required String username,
    required String password,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      _userData = await _authRepository.postLogin(
        username: username,
        password: password,
      );

      debugPrint('Raw API response: ${_userData.toString()}');

      if (_userData != null && _userData!['token'] != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', _userData!['token']);
        debugPrint('Login successful, navigating to /loginVerification');

        Get.toNamed('/loginVerification', arguments: _userData);
        return null;
      } else {
        debugPrint('Login failed: ${_userData?['message']}');
        return _userData?['message'] ?? 'Incorrect email or password';
      }
    } catch (e) {
      debugPrint('Error during login: $e');
      return 'An unexpected error occurred';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<String?> loginVerification({
    required String otp,
    required String email,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      _userData = await _authVerification.postVerify(otp: otp, email: email);

      debugPrint('Login verification response: ${_userData.toString()}');

      if (_userData != null && _userData!['success'] == true) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', _userData!['token']);
        debugPrint('Verification successful, navigating to /pageManager');

        Get.toNamed('/pageManager', arguments: _userData);
        return null;
      } else {
        debugPrint('Verification failed: ${_userData?['message']}');
        return _userData?['message'] ?? 'Verification failed';
      }
    } catch (e) {
      debugPrint('Error during verification: $e');
      return 'An unexpected error occurred';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
