import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';

class ProfileOptions extends StatelessWidget {
  const ProfileOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 5,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _container(
            context,
            color: Palette.primary,
            'Basic Info',
            Icon(Icons.info_outline, color: Palette.white),
          ),
          _container(
            context,
            isBordered: true,
            stringColor: Palette.black,
            'Journey',
            Icon(Icons.timeline, color: Palette.black),
          ),
          _container(
            context,
            isBordered: true,
            stringColor: Palette.black,
            'GMM',
            Icon(Icons.event_available, color: Palette.black),
          ),
          _container(
            context,
            'Projects',
            isBordered: true,
            stringColor: Palette.black,
            Icon(Icons.info_outline, color: Palette.black),
          ),
          _container(
            context,
            'Annual Dues',
            isBordered: true,
            stringColor: Palette.black,
            Icon(Icons.payment, color: Palette.black),
          ),
        ],
      ),
    );
  }

  Widget _container(
    BuildContext context,
    String title,
    Icon icon, {
    Color color = Palette.transparent,
    Color stringColor = Palette.white,
    bool isBordered = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      width: MediaQuery.of(context).size.width * 0.25,
      decoration: BoxDecoration(
        color: color,
        border:
            isBordered ? Border.all(width: 0.5, color: Palette.black) : null,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [icon, WidgetText(title: title, color: stringColor)],
      ),
    );
  }
}
