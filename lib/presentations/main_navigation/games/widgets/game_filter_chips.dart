import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';

class GameFilterChips extends StatelessWidget {
  final List<String> filters;
  final String selected;
  final Function(String) onSelected;

  const GameFilterChips({
    super.key,
    required this.filters,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children:
          filters.map((filter) {
            final bool isSelected = selected == filter;
            return ChoiceChip(
              label: Text(filter),
              selected: isSelected,
              showCheckmark: false,
              onSelected: (_) => onSelected(filter),
              selectedColor: Palette.neutralBlack,
              backgroundColor: Palette.neutralLightGray,
              shape: const StadiumBorder(),
              labelStyle: TextStyle(
                color: isSelected ? Palette.neutralWhite : Palette.neutralBlack,
              ),
            );
          }).toList(),
    );
  }
}
