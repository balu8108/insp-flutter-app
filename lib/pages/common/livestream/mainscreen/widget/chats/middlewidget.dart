import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/pages/common/livestream/mainscreen/widget/chats/liveleaderboard.dart';
import 'package:insp/pages/common/livestream/mainscreen/widget/livequestionpoll.dart';
import 'package:insp/pages/common/livestream/widget/chat/chat_widget_redux.dart';
import 'package:insp/redux/AppState.dart';

class MiddleWidget extends StatefulWidget {
  const MiddleWidget({super.key});

  @override
  _MiddleWidgetState createState() => _MiddleWidgetState();
}

class _MiddleWidgetState extends State<MiddleWidget> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ChatWidgetAppState>(
        converter: (store) => store.state.chatWidgetAppState,
        builder: (context, state) {
          return Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                  visible: state.pollData.correctAnswers.isNotEmpty,
                  child: const Expanded(
                    flex: 3,
                    child: SingleChildScrollView(
                        scrollDirection: Axis.vertical, child: PollTimer()),
                  )),
              Visibility(
                  visible: state.pollData.correctAnswers.isEmpty,
                  child: const Expanded(
                    flex: 3,
                    child: const LiveLeaderboard(),
                  ))
            ],
          ));
        });
  }
}
