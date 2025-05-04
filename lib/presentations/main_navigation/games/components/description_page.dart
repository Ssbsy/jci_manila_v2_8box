import 'package:flutter/material.dart';

class DescriptionPage extends StatelessWidget {
  const DescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
            title: Text(
              "Dale Ritchie",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 12),
          Text(
            "The lights are blazing and the energy is electric as the Los Angeles Lakers square off against the San Antonio Spurs in a high-stakes NBA clash! With legacies on the line and playoff dreams in play, both teams storm the court ready to leave it all out there.\n\n"
            "The Lakers, led by star power and seasoned veterans, look to dominate with explosive offense and lockdown defense. Meanwhile, the Spurs bring their signature grit, sharp ball movement, and a hunger to prove they can hang with the league’s elite.\n\n"
            "From fast breaks to buzzer-beaters, every possession counts as momentum swings like a pendulum. Expect highlight-reel dunks, clutch three-pointers, and edge-of-your-seat intensity as these two storied franchises collide.\n\n"
            "Will the Lakers rise to the occasion with their trademark flair, or will the Spurs outsmart and outwork their way to a statement win?\n\n"
            "One thing’s certain — this isn’t just a game, it’s a battle for pride, for fans, and for the future. Get ready for an unforgettable night of basketball!",
            style: TextStyle(fontSize: 15, height: 1.6),
          ),
        ],
      ),
    );
  }
}
