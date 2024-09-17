import 'package:flutter/material.dart';

void main() {
  runApp(const PointsCounter());
}

class PointsCounter extends StatefulWidget {
  const PointsCounter({super.key});

  @override
  State<PointsCounter> createState() => _PointsCounterState();
}

class _PointsCounterState extends State<PointsCounter> {
  int teamAPoints = 0;
  int teamBPoints = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text('ScoreMaster'),
        ),
        body: Container(
          // Add a light gradient to the background
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFFEE140),
                Color(0xFFFFDDC1)
              ], // Light gradient colors
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Team A Section
                      buildTeamColumn('Team A', teamAPoints, () {
                        setState(() {
                          teamAPoints++;
                        });
                      }, () {
                        setState(() {
                          teamAPoints += 2;
                        });
                      }, () {
                        setState(() {
                          teamAPoints += 3;
                        });
                      }),
                      const VerticalDivider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      // Team B Section
                      buildTeamColumn('Team B', teamBPoints, () {
                        setState(() {
                          teamBPoints++;
                        });
                      }, () {
                        setState(() {
                          teamBPoints += 2;
                        });
                      }, () {
                        setState(() {
                          teamBPoints += 3;
                        });
                      }),
                    ],
                  ),
                ),
                // Reset Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 24),
                    backgroundColor: Colors.redAccent,
                  ),
                  onPressed: () {
                    setState(() {
                      teamAPoints = 0;
                      teamBPoints = 0;
                    });
                  },
                  child: const Text(
                    'Reset',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold, // Bold text
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to create a team column
  Widget buildTeamColumn(String teamName, int points, VoidCallback addOnePoint,
      VoidCallback addTwoPoints, VoidCallback addThreePoints) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            teamName,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          // AnimatedSwitcher for text animation
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(scale: animation, child: child);
            },
            child: Text(
              '$points',
              key: ValueKey<int>(points), // Key to identify the widget
              style: const TextStyle(
                fontSize: 120,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(8),
              backgroundColor: Colors.orange,
              minimumSize: const Size(150, 50),
              textStyle: const TextStyle(fontSize: 18),
            ),
            onPressed: addOnePoint,
            child: const Text(
              'Add 1 Point',
              style: TextStyle(fontWeight: FontWeight.bold), // Bold text
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(8),
              backgroundColor: Colors.orange,
              minimumSize: const Size(150, 50),
              textStyle: const TextStyle(fontSize: 18),
            ),
            onPressed: addTwoPoints,
            child: const Text(
              'Add 2 Points',
              style: TextStyle(fontWeight: FontWeight.bold), // Bold text
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(8),
              backgroundColor: Colors.orange,
              minimumSize: const Size(150, 50),
              textStyle: const TextStyle(fontSize: 18),
            ),
            onPressed: addThreePoints,
            child: const Text(
              'Add 3 Points',
              style: TextStyle(fontWeight: FontWeight.bold), // Bold text
            ),
          ),
        ],
      ),
    );
  }
}
