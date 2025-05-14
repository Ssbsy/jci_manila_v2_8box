import 'package:flutter/material.dart';
import 'package:jci_manila_v2/core/constants/font_manager.dart';
import 'package:jci_manila_v2/core/utils/login_secure_storage.dart';

class CredentialManager {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final BuildContext context;
  final Function(bool) setRememberMeState;

  CredentialManager({
    required this.emailController,
    required this.passwordController,
    required this.context,
    required this.setRememberMeState,
  });

  Future<void> setCheck(bool? value) async {
    // if (emailController.text.trim().isEmpty ||
    //     passwordController.text.trim().isEmpty) {
    //   _showSnackBar(
    //     'Email or Password cannot be empty when saving credentials',
    //   );
    //   return;
    // }

    bool rememberMe = value ?? false;

    setRememberMeState(rememberMe);

    if (rememberMe) {
      await LoginSecureStorage.setCredentials(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
    } else {
      await LoginSecureStorage.clearCredentials();
      debugPrint('Credentials have been removed');
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: FontManager.normalWhiteMedium),
        behavior: SnackBarBehavior.fixed,
      ),
    );
  }
}
