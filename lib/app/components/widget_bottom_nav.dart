import 'package:flutter/material.dart';

class WidgetBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<Widget> items;

  const WidgetBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final isSelected = index == currentIndex;
          return GestureDetector(
            onTap: () => onTap(index),
            child: IconTheme(
              data: IconThemeData(
                color: isSelected ? Color(0xFF1B1C2B) : Colors.grey,
              ),
              child: DefaultTextStyle(
                style: TextStyle(
                  color: isSelected ? Color(0xFF1B1C2B) : Colors.grey,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
                child: items[index],
              ),
            ),
          );
        }),
      ),
    );
  }
}
