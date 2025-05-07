import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';

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
              colors: [Palette.gradientStart, Palette.gradientEnd],
            ),
          ),
          child: Center(
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
                      color: Palette.neutral50,
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
                    color: Palette.neutral300,
                    isCentered: true,
                    size: 14,
                  ),
                  const Gap(20),

                  // Login
                  Card(
                    color: Palette.neutral50,
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
                                color: Palette.neutral900,
                              ),
                            ),
                            SizedBox(height: 20),

                            //Email
                            TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Palette.neutral100,
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: Palette.neutral300,
                                ),
                                labelText: "Email",
                                hintText: "example@example.com",
                                labelStyle: TextStyle(
                                  color: Palette.neutral300,
                                ),
                                hintStyle: TextStyle(color: Palette.neutral300),
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
                                fillColor: Palette.neutral100,
                                prefixIcon: Icon(
                                  Icons.vpn_key_outlined,
                                  color: Palette.neutral300,
                                ),
                                labelText: "Password",
                                hintText: "Enter your password here",
                                labelStyle: TextStyle(
                                  color: Palette.neutral300,
                                ),
                                hintStyle: TextStyle(color: Palette.neutral300),
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
                                    Transform.scale(
                                      scale: 0.8,
                                      child: Checkbox(
                                        value: rememberMe,
                                        onChanged: (val) {
                                          setState(() {
                                            rememberMe = val!;
                                          });
                                        },
                                      ),
                                    ),
                                    WidgetText(
                                      title: 'Remember me',
                                      size: 10,
                                      color: Palette.neutral300,
                                    ),
                                  ],
                                ),
                                TextButton(
                                  onPressed: () => Get.offAllNamed('/forgot'),
                                  child: WidgetText(
                                    title: 'Forgot Password',
                                    size: 10,
                                    color: Palette.primary300,
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
                                backgroundColor: Palette.accent500,
                                minimumSize: Size.fromHeight(45),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: WidgetText(
                                title: 'Login',
                                color: Palette.neutral50,
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
                                side: BorderSide(color: Palette.accent500),
                                minimumSize: Size.fromHeight(45),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: WidgetText(
                                title: 'Register as an Applicant',
                                color: Palette.accent500,
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
      ),
    );
  }
}
