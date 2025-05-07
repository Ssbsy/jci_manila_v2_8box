import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jci_manila_v2/core/base_api/base_api.dart';
import 'package:jci_manila_v2/core/services/accounts/login_servies.dart';

class AuthProvider extends ChangeNotifier {
  final LoginServies _authRepository = LoginServies(BaseApiServices());
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

      if (_userData != null) {
        Get.toNamed('/dashboard', arguments: _userData);
        print('Login successful: $_userData');
        return null;
      } else {
        return 'Incorrect email or password';
      }
    } catch (e) {
      print('Error: $e');
      return 'An unexpected error occurred';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
