import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';

class ChangePassSuccess extends StatelessWidget {
  const ChangePassSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.neutralWhite,
      appBar: AppBar(
        backgroundColor: Palette.gradientStart,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Change Password',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.check, color: Colors.greenAccent, size: 80),
            Gap(20),
            Text(
              'Password Successfully Changed',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Palette.neutralBlack,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
