import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/presentations/main_navigation/games/components/description_page.dart';
import 'package:jci_manila_v2/presentations/main_navigation/games/components/score_page.dart';

class GameDetailPast extends StatelessWidget {
  const GameDetailPast({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Main tabs: Description, Scores
      child: Scaffold(
        backgroundColor: Palette.neutralWhite,
        appBar: AppBar(
          backgroundColor: Color(0xFF1B1C2B),
          foregroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text("Watching"),
        ),

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                "NBA Finals",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Image.asset(
              'assets/images/mlbb.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade300, width: 1),
                ),
              ),
              child: const TabBar(
                indicatorColor: Palette.accentBlue,
                labelColor: Palette.accentBlue,
                unselectedLabelColor: Palette.neutralGray,
                tabs: [Tab(text: "Description"), Tab(text: "Scores")],
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    padding: EdgeInsets.all(16),
                    child: DescriptionPage(),
                  ),

                  ScorePage(
                    team1Players: _team1Players,
                    team2Players: _team2Players,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const List<Map<String, dynamic>> _team1Players = [
  {
    "number": 30,
    "name": "Jordan Goodwin",
    "position": "F",
    "min": 33,
    "reb": 4,
    "ast": 3,
    "pts": 15,
  },
  {
    "number": 17,
    "name": "Dorian Finney-Smmith",
    "position": "F",
    "min": 28,
    "reb": 3,
    "ast": 1,
    "pts": 15,
  },
  {
    "number": 11,
    "name": "Jaxson Hayes",
    "position": "C",
    "min": 28,
    "reb": 11,
    "ast": 3,
    "pts": 9,
  },
  {
    "number": 15,
    "name": "Austin Reaves",
    "position": "G",
    "min": 36,
    "reb": 7,
    "ast": 6,
    "pts": 30,
  },
  {
    "number": 77,
    "name": "Luka Dončić",
    "position": "G",
    "min": 34,
    "reb": 9,
    "ast": 14,
    "pts": 21,
  },
  {
    "number": 7,
    "name": "Gabe Vincent",
    "position": "G",
    "min": 28,
    "reb": 2,
    "ast": 1,
    "pts": 11,
  },
  {
    "number": 4,
    "name": "Dalton Knecht",
    "position": "G",
    "min": 20,
    "reb": 3,
    "ast": 3,
    "pts": 13,
  },
  {
    "number": 2,
    "name": "Jarred Vanderbilt",
    "position": "",
    "min": 15,
    "reb": 1,
    "ast": 1,
    "pts": 2,
  },
  {
    "number": 10,
    "name": "Christian Koloko",
    "position": "",
    "min": 9,
    "reb": 2,
    "ast": 1,
    "pts": 4,
  },
  {
    "number": 20,
    "name": "Shake Milton",
    "position": "",
    "min": 7,
    "reb": 0,
    "ast": 1,
    "pts": 2,
  },
  {
    "number": 9,
    "name": "Bronny James",
    "position": "",
    "min": 2,
    "reb": 0,
    "ast": 0,
    "pts": 3,
  },
];

const List<Map<String, dynamic>> _team2Players = [
  {
    "number": 24,
    "name": "Devin Vassell",
    "position": "F",
    "min": 34,
    "reb": 8,
    "ast": 2,
    "pts": 17,
  },
  {
    "number": 40,
    "name": "Harrison Barnes",
    "position": "F",
    "min": 19,
    "reb": 2,
    "ast": 3,
    "pts": 7,
  },
  {
    "number": 18,
    "name": "Bismack Biyombo",
    "position": "C",
    "min": 20,
    "reb": 4,
    "ast": 1,
    "pts": 4,
  },
  {
    "number": 5,
    "name": "Stephon Castle",
    "position": "G",
    "min": 28,
    "reb": 8,
    "ast": 3,
    "pts": 23,
  },
  {
    "number": 3,
    "name": "Chris Paul",
    "position": "G",
    "min": 22,
    "reb": 6,
    "ast": 8,
    "pts": 9,
  },
  {
    "number": 30,
    "name": "Julian Champagnie",
    "position": "",
    "min": 29,
    "reb": 4,
    "ast": 5,
    "pts": 6,
  },
  {
    "number": 0,
    "name": "Keldon Johnson",
    "position": "",
    "min": 28,
    "reb": 4,
    "ast": 2,
    "pts": 11,
  },
  {
    "number": 10,
    "name": "Jeremy Sochan",
    "position": "",
    "min": 26,
    "reb": 3,
    "ast": 1,
    "pts": 15,
  },
  {
    "number": 14,
    "name": "Blake Wesley",
    "position": "",
    "min": 22,
    "reb": 3,
    "ast": 5,
    "pts": 7,
  },
  {
    "number": 54,
    "name": "Sandro Mamukelashvili",
    "position": "",
    "min": 13,
    "reb": 2,
    "ast": 0,
    "pts": 10,
  },
];
