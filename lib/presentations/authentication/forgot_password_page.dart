import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  final Color gradientStart = Color(0xFF1B1C2B);
  final Color gradientEnd = Color(0xFF1B3C63);
  final Color neutral50 = Color(0xFFFFFFFF);
  final Color neutral100 = Color(0xFFF5F5F5);
  final Color neutral300 = Color(0xFFBDBDBD);
  final Color neutral900 = Color(0xFF121212);
  final Color accent500 = Color(0xFF145FB0);

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
                SizedBox(height: 30),

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
                          SizedBox(height: 10),
                          Text(
                            "Please provide your email address to initiate\nthe password reset process.",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: neutral900),
                          ),
                          SizedBox(height: 20),

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
                          SizedBox(height: 20),

                          ElevatedButton(
                            onPressed: () {
                              // if (_formKey.currentState!.validate()) {
                              //   Navigator.of(context).push(
                              //     MaterialPageRoute(
                              //       builder: (context) => VerificationPage(),
                              //     ),
                              //   );
                              // }
                              Get.offAllNamed('/verification');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: accent500,
                              minimumSize: Size.fromHeight(45),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text(
                              "Confirm",
                              style: TextStyle(color: neutral50),
                            ),
                          ),
                          SizedBox(height: 10),

                          OutlinedButton(
                            onPressed: () => Navigator.pop(context),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: accent500),
                              minimumSize: Size.fromHeight(45),
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
