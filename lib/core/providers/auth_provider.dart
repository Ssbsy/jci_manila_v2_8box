import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jci_manila_v2/core/base_api/base_api.dart';
import 'package:jci_manila_v2/core/services/accounts/login_servies.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      _userData = await _authRepository.postLogin(
        username: username,
        password: password,
      );

      if (_userData != null &&
          _userData!.containsKey('token') &&
          _userData!.containsKey('user')) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', _userData!['token']);
        await prefs.setInt('user_id', _userData!['user']['id']);

        Get.toNamed('/pageManager', arguments: _userData);
        debugPrint('Login successful: $_userData');
        return null;
      } else {
        return _userData?['message'] ?? 'Incorrect email or password';
      }
    } catch (e) {
      debugPrint('Error: $e');
      return 'An unexpected error occurred';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
