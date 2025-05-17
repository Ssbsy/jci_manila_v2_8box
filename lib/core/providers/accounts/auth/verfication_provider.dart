import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jci_manila_v2/core/base_api/base_api.dart';
import 'package:jci_manila_v2/core/services/accounts/auth/login_services.dart';
import 'package:jci_manila_v2/core/services/accounts/auth/login_verification_services.dart';

class VerificationProvider extends ChangeNotifier {
  final LoginVerificationServices _verificationService =
      LoginVerificationServices(BaseApiServices());
  final LoginServices _loginService = LoginServices(BaseApiServices());

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Map<String, dynamic>? _userData;
  Map<String, dynamic>? get userData => _userData;

  Future<String?> verifyOtpAndLogin({
    required String otp,
    required String email,
    required String password,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      final otpResponse = await _verificationService.postVerify(
        otp: otp,
        email: email,
      );

      if (otpResponse?['token'] != null) {
        _userData = await _loginService.postLogin(
          username: email,
          password: password,
        );

        if (_userData?['token'] != null) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('auth_token', _userData!['token']);
          await prefs.setInt('user_id', _userData!['user']['id']);
          Get.offAllNamed('/pageManager', arguments: _userData);
          return null;
        } else {
          return 'Login failed after verification';
        }
      } else {
        return 'OTP verification failed';
      }
    } catch (e) {
      return 'An unexpected error occurred';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<String> resendOtp({required String email}) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _verificationService.resendOTP(email);
      return response?['message'] ?? 'Failed to resend OTP';
    } catch (e) {
      return 'An error occurred while resending OTP';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
