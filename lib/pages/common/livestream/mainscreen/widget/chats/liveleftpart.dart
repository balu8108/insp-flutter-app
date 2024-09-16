import 'package:flutter/material.dart';
import 'package:insp/pages/common/livestream/mainscreen/widget/chats/liveChat.dart';
import 'package:insp/pages/common/livestream/mainscreen/widget/chats/liveleaderboard.dart';
import 'package:insp/pages/common/livestream/mainscreen/widget/chats/livepollresult.dart';
import 'package:insp/pages/common/livestream/mainscreen/widget/chats/livequestion.dart';

class LiveLeftPart extends StatefulWidget {
  @override
  _LiveLeftPartState createState() => _LiveLeftPartState();
}

class _LiveLeftPartState extends State<LiveLeftPart> {
  int _selectedLeaderboardIndex = 3;

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
          Expanded(
            child:
                _leaderboards[_selectedLeaderboardIndex], // Use other widgets
          ),
          const SizedBox(height: 10),
          SizedBox(
              height: 50,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildIconButton(0, Icons.poll, "Polls"),
                    _buildIconButton(1, Icons.poll, "Poll Results"),
                    _buildIconButton(2, Icons.menu_rounded, "Ask a question"),
                    _buildIconButton(3, Icons.send, "Chats"),
                  ])),
        ],
      ),
    );
  }

  Widget _buildIconButton(int index, IconData icon, String tooltipMessage) {
    return Tooltip(
      message: tooltipMessage,
      child: GestureDetector(
        onTap: () => _onIconButtonPressed(index),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _selectedLeaderboardIndex == index
                ? Colors.blue.withOpacity(0.2)
                : Colors.transparent,
          ),
          child: Icon(
            icon,
            color:
                _selectedLeaderboardIndex == index ? Colors.blue : Colors.black,
            size: 20.0, // You can adjust the size here
          ),
        ),
      ),
    );
  }
}
