import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';

class WidgetSearchBar extends StatelessWidget {
  final TextEditingController controller;
  const WidgetSearchBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 12),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey),
          suffixIcon: Icon(Icons.search, size: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Palette.black, width: 2),
          ),
        ),
      ),
    );
  }
}
