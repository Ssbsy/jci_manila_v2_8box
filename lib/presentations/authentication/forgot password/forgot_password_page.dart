import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jci_manila_v2/core/base_api/base_api.dart';
import 'package:jci_manila_v2/core/services/accounts/auth/forgot_password_services.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  bool isLoading = false;

  final Color gradientStart = const Color(0xFF1B1C2B);
  final Color gradientEnd = const Color(0xFF1B3C63);
  final Color neutral50 = const Color(0xFFFFFFFF);
  final Color neutral100 = const Color(0xFFF5F5F5);
  final Color neutral300 = const Color(0xFFBDBDBD);
  final Color neutral900 = const Color(0xFF121212);
  final Color accent500 = const Color(0xFF145FB0);

  Future<void> submitForgotPassword() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    try {
      final response = await ForgotPasswordServices(
        BaseApiServices(),
      ).postForgotPassword(email: emailController.text.trim());

      debugPrint('Forgot Password API Response: $response');

      if (response.containsKey('message')) {
        Get.snackbar(
          'Success',
          'A verification code has been sent to your email.',
        );

        Get.offAllNamed(
          '/verification',
          arguments: {'email': emailController.text.trim()},
        );
      } else if (response.containsKey('error')) {
        Get.snackbar('Error', response['error'].toString());
      } else {
        Get.snackbar('Error', 'Unexpected response from server.');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [gradientStart, gradientEnd],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Image.asset(
                  'assets/icons/jci_manila_logo_white_1.png',
                  height: 100,
                ),
                const SizedBox(height: 30),

                // Card
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 10,
                  color: neutral50,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Forgot Password",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: neutral900,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Please provide your email address to initiate\nthe password reset process.",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: neutral900),
                          ),
                          const SizedBox(height: 20),

                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: neutral100,
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: neutral300,
                              ),
                              labelText: "Email",
                              hintText: "example@example.com",
                              labelStyle: TextStyle(color: neutral300),
                              hintStyle: TextStyle(color: neutral300),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              if (!RegExp(
                                r'^[^@]+@[^@]+\.[^@]+',
                              ).hasMatch(value)) {
                                return 'Enter a valid email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),

                          ElevatedButton(
                            onPressed: isLoading ? null : submitForgotPassword,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: accent500,
                              minimumSize: const Size.fromHeight(45),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child:
                                isLoading
                                    ? const SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Colors.white,
                                      ),
                                    )
                                    : Text(
                                      "Confirm",
                                      style: TextStyle(color: neutral50),
                                    ),
                          ),
                          const SizedBox(height: 10),

                          OutlinedButton(
                            onPressed: () => Get.offAllNamed('/login'),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: accent500),
                              minimumSize: const Size.fromHeight(45),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text(
                              "Back to login",
                              style: TextStyle(color: accent500),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
