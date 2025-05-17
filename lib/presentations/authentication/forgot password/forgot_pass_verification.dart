import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/core/base_api/base_api.dart';
import 'package:jci_manila_v2/core/constants/images.dart';
import 'package:jci_manila_v2/core/services/accounts/auth/login_verification_services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final TextEditingController pinController = TextEditingController();
  final FocusNode pinFocusNode = FocusNode();
  bool isLoading = false;
  bool isResendingOtp = false;
  late final String email;
  late final String password;

  final Color gradientStart = const Color(0xFF1B1C2B);
  final Color gradientEnd = const Color(0xFF1B3C63);
  final Color neutral50 = const Color(0xFFFFFFFF);
  final Color accent500 = const Color(0xFF145FB0);
  final Color neutral300 = const Color(0xFFBDBDBD);

  late final LoginVerificationServices verificationService;

  @override
  void initState() {
    super.initState();
    final args = Get.arguments as Map<String, dynamic>?;
    if (args != null) {
      email = args['email'] ?? '';
      password = args['password'] ?? '';
    }
    verificationService = LoginVerificationServices(BaseApiServices());
  }

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
                  Images.jciLogoWhite,
                  const Gap(30),
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
                                "We've sent a verification code to your email. "
                                "If you don't see it in your inbox, please check your spam folder.",
                            isCentered: true,
                            color: Palette.black,
                            maxLine: 10,
                          ),
                          const Gap(24),
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
                            // onCompleted: (pin) => verifyOTP(),
                            onChanged: (_) {},
                            beforeTextPaste: (text) {
                              return RegExp(r'^[0-9]+$').hasMatch(text!);
                            },
                          ),
                          const Gap(5),
                          GestureDetector(
                            // onTap: isResendingOtp ? null : resendOTP,
                            child: WidgetText(
                              title: 'Resend OTP',
                              color: Palette.accentBlue,
                              isUnderlined: true,
                            ),
                          ),
                          const Gap(15),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              // onPressed: isLoading ? null : verifyOTP,
                              onPressed: () {},
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
                                      : const Text("Continue"),
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              onPressed: () => Get.offAllNamed('/login'),
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
                                "Back",
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
