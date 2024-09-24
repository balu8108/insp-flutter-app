import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/pages/common/livestream/mainscreen/widget/chats/liveleaderboard.dart';
import 'package:insp/pages/common/livestream/mainscreen/widget/livequestionpoll.dart';
import 'package:insp/pages/common/livestream/widget/chat/chat_widget_redux.dart';
import 'package:insp/pages/common/livestream/widget/chat/poll_timer_redux.dart';
import 'package:insp/redux/AppState.dart';

class MiddleWidget extends StatefulWidget {
  const MiddleWidget({super.key});

  @override
  _MiddleWidgetState createState() => _MiddleWidgetState();
}

class _MiddleWidgetState extends State<MiddleWidget> {
  @override
  Widget build(BuildContext context) {
    print("HARSHIT");
    return StoreConnector<AppState, ChatWidgetAppState>(
        converter: (store) => store.state.chatWidgetAppState,
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                  visible: state.pollData.correctAnswers.isNotEmpty,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height - 400,
                    child: const SingleChildScrollView(
                        scrollDirection: Axis.vertical, child: PollTimer()),
                  )),
              Visibility(
                  visible: state.pollData.correctAnswers.isEmpty,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height - 400,
                    child: const LiveLeaderboard(),
                  ))
            ],
          );
        });
  }
}
