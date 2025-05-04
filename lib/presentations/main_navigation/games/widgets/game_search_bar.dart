import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';

class GameSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;

  const GameSearchBar({super.key, this.controller, this.hintText = "Search"});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Palette.neutralLightGray,
        hintText: hintText,
        hintStyle: const TextStyle(color: Palette.neutralGray),
        prefixIcon: const Icon(Icons.search, color: Palette.neutralGray),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
