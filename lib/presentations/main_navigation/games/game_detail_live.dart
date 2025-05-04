import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';

class GameDetailLive extends StatelessWidget {
  const GameDetailLive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.neutralWhite,
      appBar: AppBar(
        backgroundColor: Color(0xFF1B1C2B),
        foregroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("Live Now"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text(
                    'MLBB: ONIC VS NAVI',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Palette.neutralBlack,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  '🔴 Live Now',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Image.asset('assets/images/mlbb.png', fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    CircleAvatar(
                      radius: 14,
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Dale Ritchie",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Icon(
                      Icons.remove_red_eye_outlined,
                      size: 18,
                      color: Colors.red,
                    ),
                    SizedBox(width: 4),
                    Text("241", style: TextStyle(color: Colors.red)),
                    SizedBox(width: 10),
                    Icon(Icons.timer, size: 18),
                    SizedBox(width: 4),
                    Text("01:54:01"),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'The stage is set for an electrifying clash as ONIC faces off against NAVI in an intense Mobile Legends: Bang Bang showdown! As two of the most dominant forces in the scene, both teams enter the arena with something to prove and everything to gain. ONIC, known for their razor-sharp coordination and precise map control, are looking to assert their dominance early. On the other side, NAVI brings relentless pressure and unpredictable team fights, making every moment of the match a test of nerves, strategy, and reflexes.\n\nWith each kill, turret push, and Lord contest, the tension rises and the crowd roars louder. Fans can expect non-stop action, jaw-dropping outplays, and heart-pounding clutch moments as these titans battle for supremacy. Will ONIC’s calculated plays carry them to victory, or will NAVI’s chaos-fueled aggression tip the scales?\n\nOne thing’s for sure — this is more than just a match, it’s a showdown you don’t want to miss!',
                  style: TextStyle(height: 1.5, color: Palette.neutralBlack),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
