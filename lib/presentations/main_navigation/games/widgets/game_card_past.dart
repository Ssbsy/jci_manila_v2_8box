import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';

class GameCardPast extends StatelessWidget {
  final String imagePath;
  final String title;
  final String date;
  final VoidCallback onTap;

  const GameCardPast({
    super.key,
    required this.imagePath,
    required this.title,
    required this.date,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(imagePath, width: 60, height: 60, fit: BoxFit.cover),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Palette.neutralBlack,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(date, style: const TextStyle(color: Palette.neutralGray)),
    );
  }
}
