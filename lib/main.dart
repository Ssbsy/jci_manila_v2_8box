import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jci_manila_v2/app/theme/app_theme.dart';
import 'package:jci_manila_v2/app_providers.dart';
import 'package:jci_manila_v2/core/routes/get_pages.dart';
import 'package:provider/provider.dart';

//Certificate
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
  };
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  String? _lastRoute;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _lastRoute = Get.currentRoute;
    } else if (state == AppLifecycleState.resumed) {
      if (_lastRoute != null && _lastRoute != Get.currentRoute) {
        Future.delayed(Duration(microseconds: 500), () {
          Get.offAllNamed(_lastRoute!);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: MultiProvider(
        providers: AppProviders.providers,
        child: GetMaterialApp(
          title: 'JCI Manila',
          themeMode: ThemeMode.system,
          theme: AppTheme.lightTheme(),
          debugShowCheckedModeBanner: false,
          defaultTransition: Transition.cupertino,
          initialRoute: '/',
          getPages: GetPages.routes,
        ),
      ),
    );
  }
}
