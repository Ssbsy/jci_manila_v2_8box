import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jci_manila_v2/core/base_api/base_api.dart';
import 'package:jci_manila_v2/core/services/accounts/auth/login_services.dart';

class AuthProvider extends ChangeNotifier {
  final LoginServices _authRepository = LoginServices(BaseApiServices());

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
      final user = _userData?['user'];
      // final isVerified =
      //     (user?['verification_status'] ?? 'Unverified')
      //         .toString()
      //         .toLowerCase() ==
      //     'verified';

      // if (!isVerified) {
      //   WidgetsBinding.instance.addPostFrameCallback((_) {
      //     Get.toNamed(
      //       '/verification',
      //       arguments: {'email': username, 'password': password},
      //     );
      //   });
      //   return 'Please verify your email';
      // }

      if (_userData?['token'] != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', _userData!['token']);
        await prefs.setInt('user_id', user['id']);
        Get.toNamed('/pageManager', arguments: _userData);
        return null;
      } else {
        return _userData?['message'] ?? 'Login failed';
      }
    } catch (e) {
      return 'An unexpected error occurred';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
