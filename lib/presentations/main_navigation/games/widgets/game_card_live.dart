import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';

class GameCardLive extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;

  const GameCardLive({super.key, required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Happening Now",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Palette.neutralBlack,
          ),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: onTap,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(imagePath),
              ),

              // LIVE badge
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'LIVE',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),

              // Bottom-left: Play and Volume
              Positioned(
                bottom: 10,
                left: 10,
                child: Row(
                  children: [
                    _buildIcon(Icons.play_arrow),
                    const SizedBox(width: 10),
                    _buildIcon(Icons.volume_up),
                  ],
                ),
              ),

              // Bottom-right: Fullscreen
              Positioned(
                bottom: 10,
                right: 10,
                child: _buildIcon(Icons.fullscreen),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIcon(IconData icon) {
    return Container(
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: Colors.black.withOpacity(0.6),
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.all(6),
      child: Icon(icon, color: Colors.white, size: 18),
    );
  }
}
