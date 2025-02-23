import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/pages/common/livestream/widget/chat/chat_widget_redux.dart';
import 'package:insp/redux/AppState.dart';
import 'package:insp/widget/heading/insp_heading.dart';

class LiveLeaderboard extends StatefulWidget {
  const LiveLeaderboard({super.key});

  @override
  _LiveLeaderboardState createState() => _LiveLeaderboardState();
}

class _LiveLeaderboardState extends State<LiveLeaderboard> {
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

    return StoreConnector<AppState, ChatWidgetAppState>(
      converter: (store) => store.state.chatWidgetAppState,
      builder: (context, state) => Container(
        height: double.infinity,
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
            Expanded(
                child: ClipRect(
              child: ListView.builder(
                itemCount: state.leaderBoard.length,
                itemBuilder: (context, index) {
                  final data = state.leaderBoard[index];
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
                              data.peerDetails.name,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        Text(
                          '${data.correctAnswers}',
                          style: const TextStyle(fontSize: 12),
                        ),
                        Text(
                          '${data.combinedResponseTime} s',
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )),
          ],
        ),
      ),
    );
  }
}
