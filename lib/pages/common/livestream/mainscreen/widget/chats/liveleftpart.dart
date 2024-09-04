import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/pages/common/livestream/mainscreen/widget/chats/liveChat.dart';
import 'package:inspflutterfrontend/pages/common/livestream/mainscreen/widget/chats/liveleaderboard.dart';
import 'package:inspflutterfrontend/pages/common/livestream/mainscreen/widget/chats/livepollresult.dart';
import 'package:inspflutterfrontend/pages/common/livestream/mainscreen/widget/chats/livequestion.dart';

class LiveLeftPart extends StatefulWidget {
  @override
  _LiveLeftPartState createState() => _LiveLeftPartState();
}

class _LiveLeftPartState extends State<LiveLeftPart> {
  int _selectedLeaderboardIndex = 0;

  final List<Widget> _leaderboards = [
    LiveLeaderboard(),
    LivePollResult(),
    const LiveQuestion(),
    const LiveChat(),
  ];

  void _onIconButtonPressed(int index) {
    setState(() {
      _selectedLeaderboardIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color.fromRGBO(232, 242, 249, 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: 350, child: _leaderboards[_selectedLeaderboardIndex]),
          const SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Tooltip(
                message: "Polls", // Adjust as per your utility function
                child: IconButton(
                  icon: const Icon(Icons.poll),
                  iconSize: 16.0,
                  onPressed: () => _onIconButtonPressed(0),
                )),
            Tooltip(
                message: "Poll Results", // Adjust as per your utility function
                child: IconButton(
                  icon: const Icon(Icons.poll),
                  iconSize: 16.0,
                  onPressed: () => _onIconButtonPressed(1),
                )),
            Tooltip(
                message:
                    "Ask a question", // Adjust as per your utility function
                child: IconButton(
                  icon: const Icon(Icons.menu_rounded),
                  iconSize: 16.0,
                  onPressed: () => _onIconButtonPressed(2),
                )),
            Tooltip(
                message: "Chats", // Adjust as per your utility function
                child: IconButton(
                  icon: const Icon(Icons.send),
                  iconSize: 16.0,
                  onPressed: () => _onIconButtonPressed(3),
                ))
          ]),
        ],
      ),
    );
  }
}
