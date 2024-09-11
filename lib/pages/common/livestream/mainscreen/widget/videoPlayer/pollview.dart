import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/pages/common/livestream/mainscreen/widget/livequestionanswer.dart';
import 'package:inspflutterfrontend/pages/common/livestream/widget/chat/chat_widget_redux.dart';
import 'package:inspflutterfrontend/redux/AppState.dart';
import 'package:inspflutterfrontend/socket/mainsocket.dart';

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
        // Function to handle answer submission
        void submitAnswer(dynamic data) {
          sendAnswerHandler(data);
        }

        if (state.questionFromServer.correctAnswers.isNotEmpty) {
          return Positioned(
            bottom: 10,
            right: 10,
            child: LiveQuestionAnswer(
              polldata: state.questionFromServer,
              increasePollTimeModel: state.increasePollTimeModel,
              submitAnswer: submitAnswer,
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
