import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/pages/common/livestream/models/polldata_model.dart';
import 'package:insp/pages/common/livestream/widget/chat/chat_widget_redux.dart';
import 'package:insp/redux/AppState.dart';
import 'package:insp/socket/mainsocket.dart';
import 'package:insp/widget/popups/leaveOrEndClass/leave_or_end_class.dart';
import 'package:insp/widget/popups/questiongenerate/question_generate.dart';

class MobileActionButtonWidget extends StatefulWidget {
  const MobileActionButtonWidget({super.key, required this.isTeacher});

  final bool isTeacher;

  @override
  _ActionButtonWidgetState createState() => _ActionButtonWidgetState();
}

class _ActionButtonWidgetState extends State<MobileActionButtonWidget> {
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
          ]);
        });
  }
}
