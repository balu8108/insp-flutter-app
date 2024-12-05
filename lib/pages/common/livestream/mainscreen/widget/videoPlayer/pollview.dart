import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/pages/common/livestream/mainscreen/widget/livequestionanswer.dart';
import 'package:insp/pages/common/livestream/widget/chat/chat_widget_redux.dart';
import 'package:insp/redux/AppState.dart';

class PollViewWidget extends StatefulWidget {
  const PollViewWidget({super.key});

  @override
  _PollViewWidgetState createState() => _PollViewWidgetState();
}

class _PollViewWidgetState extends State<PollViewWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ChatWidgetAppState>(
      converter: (store) => store.state.chatWidgetAppState,
      builder: (context, state) {
        if (state.questionFromServer.correctAnswers.isNotEmpty) {
          return Positioned(
            bottom: 10,
            right: 10,
            child: LiveQuestionAnswer(
              polldata: state.questionFromServer,
              increasePollTimeModel: state.increasePollTimeModel,
            ),
          );
        } else {
          return const SizedBox
              .shrink(); // Return an empty widget if there are no correct answers
        }
      },
    );
  }
}
