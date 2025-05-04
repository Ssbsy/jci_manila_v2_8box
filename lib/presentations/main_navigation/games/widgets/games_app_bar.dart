import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';

class GamesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GamesAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Palette.gradientStart, Palette.gradientEnd],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 16),
            child: Text(
              'Games',
              style: TextStyle(
                color: Palette.neutralWhite,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: 36,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Palette.neutralWhite,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              children: const [
                CircleAvatar(
                  radius: 14,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
                SizedBox(width: 6),
                Icon(Icons.menu, size: 18, color: Palette.neutralBlack),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
