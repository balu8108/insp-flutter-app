import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/widget/heading/insp_heading.dart';

class LiveLeaderboard extends StatelessWidget {
  LiveLeaderboard();

  @override
  Widget build(BuildContext context) {
    const Map<int, String> leaderboardRankingIcons = {
      1: 'assets/images/leaderboardranks/first.png',
      2: 'assets/images/leaderboardranks/second.png',
      3: 'assets/images/leaderboardranks/third.png',
      4: 'assets/images/leaderboardranks/fourth.png',
      5: 'assets/images/leaderboardranks/fifth.png',
      6: 'assets/images/leaderboardranks/sixth.png',
      7: 'assets/images/leaderboardranks/seventh.png',
      8: 'assets/images/leaderboardranks/eighth.png',
      9: 'assets/images/leaderboardranks/ninth.png',
      10: 'assets/images/leaderboardranks/tenth.png',
    };

    final List<Map<String, dynamic>> leaderBoard = [
      {'id': 1, 'name': 'Alice', 'correctAnswers': 10, 'responseTime': 120},
      {'id': 2, 'name': 'Bob', 'correctAnswers': 8, 'responseTime': 150},
      {'id': 3, 'name': 'Alice', 'correctAnswers': 10, 'responseTime': 120},
      {'id': 4, 'name': 'Bob', 'correctAnswers': 8, 'responseTime': 150},
      {'id': 5, 'name': 'Alice', 'correctAnswers': 10, 'responseTime': 120},
      {'id': 6, 'name': 'Bob', 'correctAnswers': 8, 'responseTime': 150},
      {'id': 7, 'name': 'Alice', 'correctAnswers': 10, 'responseTime': 120},
      {'id': 8, 'name': 'Bob', 'correctAnswers': 8, 'responseTime': 150},
      {'id': 9, 'name': 'Alice', 'correctAnswers': 10, 'responseTime': 120},
      {'id': 10, 'name': 'Bob', 'correctAnswers': 8, 'responseTime': 150},
      // Add more items as needed
    ];

    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(flex: 9, child: INSPHeading('Leader Board')),
            ],
          ),
          const SizedBox(height: 15),
          leaderBoard.isEmpty
              ? const Text(
                  "No Data",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(44, 51, 41, 0.47),
                    height: 1.75,
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: leaderBoard.length,
                    itemBuilder: (context, index) {
                      final data = leaderBoard[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  leaderboardRankingIcons[index + 1] ??
                                      'assets/images/leaderboardranks/tenth.png',
                                  height: 20,
                                  width: 20,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  data['name'],
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                            Text(
                              '${data['correctAnswers']}',
                              style: const TextStyle(fontSize: 12),
                            ),
                            Text(
                              '${data['responseTime']}s',
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
