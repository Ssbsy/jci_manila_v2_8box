import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/presentations/authentication/login_page.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationPage extends StatelessWidget {
  final Color gradientStart = const Color(0xFF1B1C2B);
  final Color gradientEnd = const Color(0xFF1B3C63);
  final Color neutral50 = const Color(0xFFFFFFFF);
  final Color accent500 = const Color(0xFF145FB0);
  final Color neutral300 = const Color(0xFFBDBDBD);

  final TextEditingController pinController = TextEditingController();
  final FocusNode pinFocusNode = FocusNode();

  VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Image.asset(
                    'assets/icons/jci_manila_logo_white_1.png',
                    height: 100,
                  ),
                  const SizedBox(height: 30),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 10,
                    color: neutral50,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Text(
                            "Verification",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Palette.black,
                            ),
                          ),
                          const SizedBox(height: 16),
                          WidgetText(
                            title:
                                "We've sent a verification code to your email. If you don't see it in your inbox, please check your spam folder.",
                            isCentered: true,
                            color: Palette.black,
                            maxLine: 10,
                          ),
                          const SizedBox(height: 24),
                          PinCodeTextField(
                            appContext: context,
                            length: 6,
                            controller: pinController,
                            focusNode: pinFocusNode,
                            obscureText: false,
                            animationType: AnimationType.scale,
                            keyboardType: TextInputType.number,
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(8),
                              borderWidth: 0.5,
                              fieldHeight: 55,
                              fieldWidth: 40,
                              activeFillColor: neutral50,
                              activeColor: accent500,
                              selectedFillColor: neutral50,
                              selectedColor: accent500,
                              inactiveFillColor: neutral50,
                              inactiveColor: neutral300,
                              errorBorderColor: Colors.red,
                            ),
                            animationDuration: const Duration(
                              milliseconds: 200,
                            ),
                            enableActiveFill: true,
                            autoFocus: true,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            onCompleted: (pin) {
                              Get.offAllNamed('/newpass');
                            },
                            onChanged: (value) {},
                            beforeTextPaste: (text) {
                              return RegExp(r'^[0-9]+$').hasMatch(text!);
                            },
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (pinController.text.length == 6) {
                                  Get.offAllNamed('/newpass');
                                } else {
                                  Get.snackbar(
                                    'Incomplete Code',
                                    'Please enter the 6-digit verification code',
                                    snackPosition: SnackPosition.BOTTOM,
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: accent500,
                                foregroundColor: neutral50,
                                minimumSize: const Size.fromHeight(45),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                              ),
                              child: const Text("Continue"),
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              onPressed: () {
                                Get.offAll(() => LoginPage());
                              },
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: accent500),
                                minimumSize: const Size.fromHeight(45),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                              ),
                              child: Text(
                                "Back to login",
                                style: TextStyle(color: accent500),
                              ),
                            ),
                          ),
                        ],
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
