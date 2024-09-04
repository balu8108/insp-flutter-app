import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/pages/common/livestream/mainscreen/widget/livequestionanswer.dart';
import 'package:inspflutterfrontend/pages/common/livestream/models/polldata_model.dart';
import 'package:inspflutterfrontend/pages/common/livestream/widget/chat/chat_widget_redux.dart';
import 'package:inspflutterfrontend/pages/common/recordingplayer/webview.dart';
import 'package:inspflutterfrontend/redux/AppState.dart';
import 'package:inspflutterfrontend/socket/mainsocket.dart';
import 'package:inspflutterfrontend/utils/userDetail/getUserDetail.dart';
import 'package:inspflutterfrontend/widget/popups/questiongenerate/question_generate.dart';

class TPStreamLiveVideoPlayerWidget extends StatefulWidget {
  const TPStreamLiveVideoPlayerWidget({super.key});

  @override
  _TPStreamLiveVideoPlayerWidgetState createState() =>
      _TPStreamLiveVideoPlayerWidgetState();
}

class _TPStreamLiveVideoPlayerWidgetState
    extends State<TPStreamLiveVideoPlayerWidget> {
  @override
  void initState() {
    super.initState();
    // Fetch the video URL when the widget is initialized
  }

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    store.dispatch(getVideoUrlApi(context));

    return StoreConnector<AppState, ChatWidgetAppState>(
      converter: (store) => store.state.chatWidgetAppState,
      builder: (context, ChatWidgetAppState state) {
        // Function to handle poll generation
        void generatePoll(PollDataModel data) {
          sendQuestionHandler(store, data);
        }

        // Function to handle answer submission
        void submitAnswer(dynamic data) {
          sendAnswerHandler(data);
        }

        return FutureBuilder<bool>(
          future: isTeacherLogin(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error loading data'));
            } else {
              bool isTeacher = snapshot.data ?? false;
              return Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height - 150 < 600
                        ? MediaQuery.of(context).size.height - 150
                        : 600,
                    width: double.infinity,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color.fromRGBO(232, 242, 249, 1),
                    ),
                    child: state.videoResponse.playback_url.isNotEmpty
                        ? WebviewUniversal(
                            url: state.videoResponse.playback_url,
                          )
                        : const Text("wait..."),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      if (isTeacher)
                        Column(
                          children: [
                            Tooltip(
                              message: "Polls",
                              child: GestureDetector(
                                onTap: () => showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return QuestionGenerate.getScreen(
                                      sendPollToServer: generatePoll,
                                    );
                                  },
                                ),
                                child: const Icon(
                                  Icons.poll,
                                  size:
                                      24.0, // Increased icon size for better usability
                                ),
                              ),
                            ),
                          ],
                        ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          leaveRoomHandler(store);
                        },
                        child: SizedBox(
                          width: 100,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(
                                  200, 50.0), // Fixed size for button
                              backgroundColor:
                                  const Color(0xFFF63F4A), // Background color
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(20), // Border radius
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Leave',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (state.questionFromServer.correctAnswers.isNotEmpty)
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: LiveQuestionAnswer(
                        polldata: state.questionFromServer,
                        increasePollTimeModel: state.increasePollTimeModel,
                        submitAnswer: submitAnswer,
                      ),
                    ),
                ],
              );
            }
          },
        );
      },
    );
  }
}
