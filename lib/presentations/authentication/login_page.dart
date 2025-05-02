import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/presentations/authentication/forgot_password_page.dart';
import 'package:jci_manila_v2/presentations/authentication/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool rememberMe = false;

  final Color gradientStart = Color(0xFF1B1C2B); // Top background
  final Color gradientEnd = Color(0xFF1B3C63); // Bottom background
  final Color neutral900 = Color(0xFF121212); // Text black
  final Color neutral50 = Color(0xFFFFFFFF); // Card background
  final Color accent500 = Color(0xFF145FB0); // New blue button color
  final Color neutral300 = Color(0xFFBDBDBD); // Label/hint grey
  final Color neutral100 = Color(0xFFF5F5F5); // Input background
  final Color primary300 = Color(0xFF64B5F6); // Link blue

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [gradientStart, gradientEnd],
            ),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/jci_manila_logo_white_1.png',
                  height: 100,
                ),
                Text(
                  "We are a University of Leaders",
                  style: TextStyle(
                    color: neutral50,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const Gap(5),
                WidgetText(
                  title:
                      "An organization of young men turned great leaders"
                      "aiming to create positive changes in the community"
                      "as a whole.",
                  maxLine: 4,
                  color: neutral300,
                  isCentered: true,
                  size: 14,
                ),
                const Gap(20),

                // Login
                Card(
                  color: neutral50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Text(
                            "Member's Login",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: neutral900,
                            ),
                          ),
                          SizedBox(height: 20),

                          //Email
                          TextFormField(
                            controller: _emailController,
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
                          SizedBox(height: 15),

                          // Password
                          TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: neutral100,
                              prefixIcon: Icon(
                                Icons.vpn_key_outlined,
                                color: neutral300,
                              ),
                              labelText: "Password",
                              hintText: "Enter your password here",
                              labelStyle: TextStyle(color: neutral300),
                              hintStyle: TextStyle(color: neutral300),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10),

                          // Forgot
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: rememberMe,
                                    onChanged: (val) {
                                      setState(() {
                                        rememberMe = val!;
                                      });
                                    },
                                  ),
                                  WidgetText(
                                    title: 'Remember me',
                                    color: neutral300,
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () => Get.offAllNamed('/forgot'),
                                child: WidgetText(
                                  title: 'Forgot Password',
                                  color: primary300,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),

                          // Login Button
                          ElevatedButton(
                            onPressed: () {
                              // if (_formKey.currentState!.validate()) {
                              //   Get.offAllNamed('/pageManager');
                              // }
                              Get.offAllNamed('/pageManager');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: accent500,
                              minimumSize: Size.fromHeight(45),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: WidgetText(
                              title: 'Login',
                              color: neutral50,
                              isBold: true,
                              size: 14,
                            ),
                          ),
                          const Gap(10),

                          // Register Button
                          OutlinedButton(
                            onPressed: () {
                              Get.offAllNamed('/register');
                            },
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: accent500),
                              minimumSize: Size.fromHeight(45),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: WidgetText(
                              title: 'Register as an Applicant',
                              color: accent500,
                              size: 14,
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
