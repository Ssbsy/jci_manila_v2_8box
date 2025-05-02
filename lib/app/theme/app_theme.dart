import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    SystemChrome.restoreSystemUIOverlays();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Palette.black,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Palette.scaffoldWhite,
      colorScheme: ColorScheme.fromSeed(seedColor: Palette.primary),
      appBarTheme: AppBarTheme(
        backgroundColor: Palette.white,
        iconTheme: IconThemeData(color: Palette.black),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Palette.primary,
        elevation: 0,
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: Palette.white,
        shape: RoundedRectangleBorder(),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: WidgetStatePropertyAll(0),
          backgroundColor: WidgetStatePropertyAll(Palette.primary),
        ),
      ),
      tabBarTheme: TabBarTheme(dividerColor: Palette.transparent),
      dialogTheme: DialogThemeData(
        elevation: 0,
        backgroundColor: Palette.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
