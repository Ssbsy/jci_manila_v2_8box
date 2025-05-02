import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:jci_manila_v2/app/theme/app_theme.dart';
import 'package:jci_manila_v2/core/routes/get_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
  };
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: GetMaterialApp(
        title: 'JCI Manila',
        themeMode: ThemeMode.dark,
        theme: AppTheme.lightTheme(),
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.cupertino,
        initialRoute: '/',
        getPages: GetPages.routes,
      ),
    );
  }
}
