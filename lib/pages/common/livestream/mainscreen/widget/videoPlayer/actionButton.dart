import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/pages/common/livestream/models/polldata_model.dart';
import 'package:insp/pages/common/livestream/widget/chat/chat_widget_redux.dart';
import 'package:insp/redux/AppState.dart';
import 'package:insp/socket/mainsocket.dart';
import 'package:insp/widget/popups/leaveOrEndClass/leave_or_end_class.dart';
import 'package:insp/widget/popups/questiongenerate/question_generate.dart';

class ActionButtonWidget extends StatefulWidget {
  const ActionButtonWidget(
      {super.key,
      required this.isTeacher,
      required this.isFullScreen,
      required this.fullScreen});

  final bool isTeacher, isFullScreen;
  final Function() fullScreen;

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
          void generatePoll(PollDataModel data) {
            sendQuestionHandler(StoreProvider.of<AppState>(context), data);
          }

          return Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    if (widget.isTeacher)
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
                          minimumSize: const Size(200, 30.0),
                          backgroundColor: const Color(0xFFF63F4A),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return LeaveOrEndClassPopup(
                                  isTeacher: widget.isTeacher);
                            },
                          );
                        },
                        child: Text(
                          widget.isTeacher ? 'End' : 'Leave',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                Tooltip(
                  message:
                      widget.isFullScreen ? "Exit FullScreen" : "FullScreen",
                  child: IconButton(
                    icon: widget.isFullScreen
                        ? const Icon(Icons.fullscreen_exit)
                        : const Icon(Icons.fullscreen),
                    iconSize: 24.0,
                    onPressed: () {
                      widget.fullScreen();
                    },
                  ),
                ),
              ],
            ),
          ]);
        });
  }
}
