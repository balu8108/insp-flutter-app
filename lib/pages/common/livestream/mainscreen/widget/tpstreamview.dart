import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/pages/common/livestream/mainscreen/widget/livequestionanswer.dart';
import 'package:inspflutterfrontend/pages/common/livestream/models/polldata_model.dart';
import 'package:inspflutterfrontend/pages/common/livestream/widget/chat/chat_widget_redux.dart';
import 'package:inspflutterfrontend/pages/common/recordingplayer/webview.dart';
import 'package:inspflutterfrontend/redux/AppState.dart';
import 'package:inspflutterfrontend/socket/mainsocket.dart';
import 'package:inspflutterfrontend/widget/popups/questiongenerate/question_generate.dart';

class TPStreamLiveVideoPlayerWidget extends StatelessWidget {
  TPStreamLiveVideoPlayerWidget();

  static void dispatch(BuildContext context, ChatWidgetAppState action) {
    StoreProvider.of<AppState>(context).dispatch(action);
  }

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);

    // Function to handle poll generation
    void generatePoll(PollDataModel data) {
      sendQuestionHandler(store, data);
    }

    // Function to handle answer submission
    void submitAnswer(dynamic data) {
      sendAnswerHandler(data);
    }

    return StoreConnector<AppState, ChatWidgetAppState>(
      converter: (store) => store.state.chatWidgetAppState,
      builder: (context, ChatWidgetAppState state) => Container(
        height: 600,
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromRGBO(232, 242, 249, 1),
        ),
        child: WebviewUniversal(),
      ),
      // Transparent GestureDetector for handling taps in the button area
      // Positioned(
      //   bottom: 50,
      //   left: 100,
      //   child: GestureDetector(
      //     onTap: () {
      //       leaveRoomHandler(store);
      //     },
      //     child: AbsorbPointer(
      //       absorbing: true, // Prevents the WebView from capturing the tap
      //       child: SizedBox(
      //         width: 100,
      //         child: ElevatedButton(
      //           style: ElevatedButton.styleFrom(
      //             minimumSize:
      //                 const Size(200, 50.0), // Fixed size for button
      //             backgroundColor:
      //                 const Color(0xFFF63F4A), // Background color
      //             shape: RoundedRectangleBorder(
      //               borderRadius:
      //                   BorderRadius.circular(20), // Border radius
      //             ),
      //           ),
      //           onPressed: () {},
      //           child: const Text(
      //             'Leave',
      //             style: TextStyle(color: Colors.white),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
      // Positioned(
      //   bottom: 50,
      //   left: 10,
      //   child: Column(
      //     children: [
      //       Tooltip(
      //         message: "Polls",
      //         child: GestureDetector(
      //           onTap: () => showDialog(
      //             context: context,
      //             builder: (BuildContext context) {
      //               return QuestionGenerate.getScreen(
      //                 sendPollToServer: generatePoll,
      //               );
      //             },
      //           ),
      //           child: const Icon(
      //             Icons.poll,
      //             size: 24.0, // Increased icon size for better usability
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      // // Live Question and Answer Widget
      // if (state.questionFromServer.correctAnswers.isNotEmpty)
      //   Positioned(
      //     bottom: 10,
      //     right: 10,
      //     child: LiveQuestionAnswer(
      //       polldata: state.questionFromServer,
      //       increasePollTimeModel: state.increasePollTimeModel,
      //       submitAnswer: submitAnswer,
      //     ),
      //   ),
    );
  }
}
