import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/pages/common/livestream/widget/chat/chat_widget_redux.dart';
import 'package:insp/redux/AppState.dart';
import 'package:insp/socket/mainsocket.dart';
import 'package:insp/utils/extensions.dart';

class LeaveOrEndClassPopup extends StatelessWidget {
  const LeaveOrEndClassPopup({super.key, required this.isTeacher});

  final bool isTeacher;

  @override
  Widget build(BuildContext context) {
    bool isWebOrLandScape = context.isWebOrLandScape();
    void leaveOrEnd() {
      if (isTeacher) {
        endMeetHandler(StoreProvider.of<AppState>(context), context);
      } else {
        leaveRoomHandler(StoreProvider.of<AppState>(context));
        Navigator.pop(context);
      }
    }

    void defaultLoaderFunction() {}

    return StoreConnector<AppState, ChatWidgetAppState>(
        converter: (store) => store.state.chatWidgetAppState,
        builder: (context, state) => AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 26, horizontal: 28),
              insetPadding: isWebOrLandScape ? null : EdgeInsets.zero,
              title: Row(
                children: [
                  const Text("",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      )),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              content: SizedBox(
                height: 50,
                width: 400, // Set your desired width here
                child: Column(
                  mainAxisAlignment: MainAxisAlignment
                      .start, // Aligns the column to the start (top)
                  crossAxisAlignment: CrossAxisAlignment
                      .start, // Aligns the text to the start (left)
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Are you sure you want ${isTeacher ? "end" : "leave"} the class?",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor:
                              const Color.fromRGBO(60, 141, 188, 1),
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        child: const Text("No"),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        onPressed: state.isClassEnded
                            ? defaultLoaderFunction
                            : leaveOrEnd,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor:
                              const Color.fromRGBO(60, 141, 188, 1),
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        child: state.isClassEnded
                            ? const SizedBox(
                                width: 18,
                                height: 18,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                ),
                              )
                            : const Text("Ok"),
                      ),
                    ),
                  ],
                ),
              ],
            ));
  }
}
