import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/pages/common/livestream/mainscreen/widget/livequestionanswer.dart';
import 'package:inspflutterfrontend/pages/common/livestream/models/polldata_model.dart';
import 'package:inspflutterfrontend/pages/common/livestream/widget/chat/chat_widget_redux.dart';
import 'package:inspflutterfrontend/redux/AppState.dart';
import 'package:inspflutterfrontend/socket/mainsocket.dart';
import 'package:inspflutterfrontend/utils/userDetail/getUserDetail.dart';
import 'package:inspflutterfrontend/widget/popups/questiongenerate/question_generate.dart';

class ActionButtonWidget extends StatefulWidget {
  const ActionButtonWidget({super.key});

  @override
  _ActionButtonWidgetState createState() => _ActionButtonWidgetState();
}

class _ActionButtonWidgetState extends State<ActionButtonWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ChatWidgetAppState>(
        converter: (store) => store.state.chatWidgetAppState,
        builder: (context, ChatWidgetAppState state) {
          // Function to handle poll generation
          void generatePoll(PollDataModel data) {
            sendQuestionHandler(StoreProvider.of<AppState>(context), data);
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
                  return Column(children: [
                    Row(
                      children: [
                        // if (isTeacher)
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
                                  size: 24.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 20),
                        SizedBox(
                          width: 100,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(200, 50.0),
                              backgroundColor: const Color(0xFFF63F4A),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () {
                              leaveRoomHandler(
                                  StoreProvider.of<AppState>(context));
                            },
                            child: const Text(
                              'Leave',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]);
                }
              });
        });
  }
}
