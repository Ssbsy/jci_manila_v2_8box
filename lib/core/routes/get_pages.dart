import 'package:get/get.dart';
import 'package:jci_manila_v2/presentations/authentication/forgot_password_page.dart';
import 'package:jci_manila_v2/presentations/authentication/login/login_page.dart';
import 'package:jci_manila_v2/presentations/authentication/login/login_verification_screen.dart';
import 'package:jci_manila_v2/presentations/authentication/new_password_page.dart';
import 'package:jci_manila_v2/presentations/authentication/register_page.dart';
import 'package:jci_manila_v2/presentations/authentication/verification_page.dart';
import 'package:jci_manila_v2/presentations/drawer/business_directory/business_directory_screen.dart';
import 'package:jci_manila_v2/presentations/drawer/members_database/members_database_screen.dart';
import 'package:jci_manila_v2/presentations/drawer/official_groups/official_groups_screen.dart';
import 'package:jci_manila_v2/presentations/drawer/profile/profile_screen.dart';
import 'package:jci_manila_v2/presentations/drawer/profile/screen/profile_edit_screen.dart';
import 'package:jci_manila_v2/presentations/drawer/project/project_screen.dart';
import 'package:jci_manila_v2/presentations/drawer/project/screens/add_project_screen.dart';
import 'package:jci_manila_v2/presentations/drawer/project/screens/project_details_screen.dart';
import 'package:jci_manila_v2/presentations/drawer/resources/resources_screen.dart';
import 'package:jci_manila_v2/presentations/drawer/resources/screens/board_of_directors_screen.dart';
import 'package:jci_manila_v2/presentations/drawer/resources/screens/creed_screen.dart';
import 'package:jci_manila_v2/presentations/drawer/resources/screens/history_screen.dart';
import 'package:jci_manila_v2/presentations/drawer/settings/settings_screen.dart';
import 'package:jci_manila_v2/presentations/drawer/sponsors/screens/sponsor_details_screen.dart';
import 'package:jci_manila_v2/presentations/drawer/sponsors/sponsors_screen.dart';
import 'package:jci_manila_v2/presentations/main_navigation/home/screens/create_post_screen.dart';
import 'package:jci_manila_v2/presentations/main_navigation/page_manager.dart';
import 'package:jci_manila_v2/presentations/start/on_boarding_screen.dart';
import 'package:jci_manila_v2/presentations/start/splash_screen.dart';

class GetPages {
  static final routes = [
    GetPage(name: '/', page: () => SplashScreen()),
    GetPage(name: '/onboarding', page: () => OnboardingScreen()),
    GetPage(name: '/login', page: () => LoginPage()),
    GetPage(name: '/loginVerification', page: () => LoginVerificationScreen()),
    GetPage(name: '/register', page: () => RegisterPage()),
    GetPage(name: '/forgot', page: () => ForgotPasswordPage()),
    GetPage(name: '/newpass', page: () => NewPasswordPage()),
    GetPage(name: '/verification', page: () => VerificationPage()),
    GetPage(name: '/pageManager', page: () => PageManager()),
    GetPage(name: '/projects', page: () => ProjectScreen()),
    GetPage(name: '/business', page: () => BusinessDirectoryScreen()),
    GetPage(name: '/groups', page: () => OfficialGroupsScreen()),
    GetPage(name: '/database', page: () => MembersDatabaseScreen()),
    GetPage(name: '/sponsors', page: () => SponsorsScreen()),
    GetPage(name: '/resources', page: () => ResourcesScreen()),
    GetPage(name: '/settings', page: () => SettingsScreen()),
    GetPage(name: '/post', page: () => CreatePostScreen()),
    GetPage(name: '/sponsorDetails', page: () => SponsorDetailsScreen()),
    GetPage(name: '/history', page: () => HistoryScreen()),
    GetPage(name: '/creed', page: () => CreedScreen()),
    GetPage(name: '/BOD', page: () => BoardOfDirectorsScreen()),
    GetPage(name: '/projectDetails', page: () => ProjectDetailsScreen()),
    GetPage(name: '/addProject', page: () => AddProjectScreen()),
    GetPage(name: '/profile', page: () => ProfileScreen()),
    GetPage(name: '/profileEdit', page: () => ProfileEditScreen()),
  ];
}
