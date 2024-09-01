import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/pages/common/livestream/mainscreen/widget/livequestionanswer.dart';
import 'package:inspflutterfrontend/pages/common/livestream/models/polldata_model.dart';
import 'package:inspflutterfrontend/pages/common/livestream/widget/chat/chat_widget_redux.dart';
import 'package:inspflutterfrontend/redux/AppState.dart';
import 'package:inspflutterfrontend/socket/mainsocket.dart';
import 'package:inspflutterfrontend/widget/popups/questiongenerate/question_generate.dart';
import 'package:desktop_webview_window/desktop_webview_window.dart';

class TPStreamLiveVideoPlayerWidget extends StatelessWidget {
  TPStreamLiveVideoPlayerWidget();

  static void dispatch(BuildContext context, ChatWidgetAppState action) {
    StoreProvider.of<AppState>(context).dispatch(action);
  }

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);

    void generatePoll(PollDataModel data) {
      sendQuestionHandler(store, data);
    }

    void submitAnswer(dynamic data) {
      sendAnswerHandler(data);
    }

    return StoreConnector<AppState, ChatWidgetAppState>(
      converter: (store) => store.state.chatWidgetAppState,
      builder: (context, ChatWidgetAppState state) => Stack(
        children: [
          Container(
              height: 650,
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.black12,
              ),
              child: Text("TP Stream content")),
          Positioned(
              bottom: 50,
              left: 100,
              child: SizedBox(
                width: 100,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(
                        200, 50.0), // Set a fixed size for the button
                    backgroundColor:
                        const Color(0xFFF63F4A), // Background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Border radius
                    ),
                  ),
                  onPressed: () {
                    leaveRoomHandler(store);
                  },
                  child: const Text(
                    'Leave',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )),
          Positioned(
              bottom: 50,
              left: 10,
              child: Column(
                children: [
                  Tooltip(
                      message: "Polls", // Adjust as per your utility function
                      child: IconButton(
                        icon: const Icon(Icons.poll),
                        iconSize: 16.0,
                        onPressed: () => showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return QuestionGenerate.getScreen(
                                  sendPollToServer: generatePoll);
                            }),
                      )),
                ],
              )),
          if (state.questionFromServer.correctAnswers.isNotEmpty)
            Positioned(
                bottom: 10,
                right: 10,
                child: LiveQuestionAnswer(
                    polldata: state.questionFromServer,
                    increasePollTimeModel: state.increasePollTimeModel,
                    submitAnswer: submitAnswer))
          // Additional children widgets can be added here, such as LiveQuestionAnswer().
        ],
      ),
    );
  }
}
