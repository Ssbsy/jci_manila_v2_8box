import 'package:get/get.dart';
import 'package:jci_manila_v2/presentations/authentication/forgot_password_page.dart';
import 'package:jci_manila_v2/presentations/authentication/login_page.dart';
import 'package:jci_manila_v2/presentations/authentication/new_password_page.dart';
import 'package:jci_manila_v2/presentations/authentication/register_page.dart';
import 'package:jci_manila_v2/presentations/authentication/verification_page.dart';
import 'package:jci_manila_v2/presentations/main_navigation/page_manager.dart';
import 'package:jci_manila_v2/presentations/start/on_boarding_screen.dart';
import 'package:jci_manila_v2/presentations/start/splash_screen.dart';

class GetPages {
  static final routes = [
    GetPage(name: '/', page: () => SplashScreen()),
    GetPage(name: '/onboarding', page: () => OnboardingScreen()),
    GetPage(name: '/login', page: () => LoginPage()),
    GetPage(name: '/register', page: () => RegisterPage()),
    GetPage(name: '/forgot', page: () => ForgotPasswordPage()),
    GetPage(name: '/newpass', page: () => NewPasswordPage()),
    GetPage(name: '/verification', page: () => VerificationPage()),
    GetPage(name: '/pageManager', page: () => PageManager()),
  ];
}
