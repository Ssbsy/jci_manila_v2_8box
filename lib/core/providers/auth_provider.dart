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
      final response = await _authRepository.postLogin(
        username: username,
        password: password,
      );

      _userData = response;

      debugPrint('Raw login response: $_userData');

      final user = _userData?['user'];
      final verificationStatus = user?['verification_status'] ?? 'Unverified';
      final isVerified =
          verificationStatus.toString().toLowerCase() == 'verified';

      if (!isVerified) {
        final resendMessage = await resendOTP(email: username);
        debugPrint('Resend OTP result: $resendMessage');

        WidgetsBinding.instance.addPostFrameCallback((_) {
          Get.toNamed(
            '/loginVerification',
            arguments: {'email': username, 'password': password},
          );
        });

        return resendMessage ?? 'Please verify your email';
      } else if (_userData?['token'] != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', _userData!['token']);
        await prefs.setInt('user_id', _userData!['user']['id']);

        Get.toNamed('/pageManager', arguments: _userData);
        debugPrint('Login successful: $_userData');
        return null;
      } else {
        return _userData?['message'] ?? 'Login failed';
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
    required String password,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      final otpResponse = await _authVerification.postVerify(
        otp: otp,
        email: email,
      );
      debugPrint('OTP response: $otpResponse');

      if (otpResponse != null && otpResponse['token'] != null) {
        _userData = await _authRepository.postLogin(
          username: email,
          password: password,
        );

        if (_userData != null && _userData!['token'] != null) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('auth_token', _userData!['token']);
          debugPrint('Login complete, navigating to /pageManager');

          Get.offAllNamed('/pageManager', arguments: _userData);
          return null;
        } else {
          return 'Login failed after OTP verification';
        }
      } else {
        return 'OTP verification failed: No token returned';
      }
    } catch (e) {
      debugPrint('Error during OTP login verification: $e');
      return 'An unexpected error occurred';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<String?> resendOTP({required String email}) async {
    _isLoading = true;
    notifyListeners();

    try {
      final resendResponse = await _authVerification.resendOTP(email);
      debugPrint('Resend OTP response: $resendResponse');

      if (resendResponse != null && resendResponse['message'] != null) {
        return resendResponse['message'];
      } else {
        return 'Failed to resend OTP. Please try again later.';
      }
    } catch (e) {
      debugPrint('Error while resending OTP: $e');
      return 'An error occurred while resending OTP';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
