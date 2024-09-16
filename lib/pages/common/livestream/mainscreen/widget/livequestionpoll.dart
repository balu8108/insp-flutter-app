import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/pages/common/livestream/widget/chat/chat_widget_redux.dart';
import 'package:insp/redux/AppState.dart';
import 'package:insp/socket/mainsocket.dart';

class PollTimer extends StatefulWidget {
  PollTimer();

  @override
  _PollTimerState createState() => _PollTimerState();
}

class _PollTimerState extends State<PollTimer> {
  int timer = 0;
  Timer? countdownTimer;
  bool isTimerInitialized = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final pollData =
          StoreProvider.of<AppState>(context).state.chatWidgetAppState.pollData;

      if (!isTimerInitialized && pollData != null) {
        setState(() {
          timer = pollData.time;
        });
        _startTimer();
      }
    });
  }

  void _startTimer() {
    countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (this.timer > 0) {
        setState(() {
          this.timer -= 1;
        });
      } else {
        countdownTimer?.cancel();
        StoreProvider.of<AppState>(context).dispatch(cleanState());
      }
    });
  }

  @override
  void didUpdateWidget(covariant PollTimer oldWidget) {
    super.didUpdateWidget(oldWidget);
    final pollData =
        StoreProvider.of<AppState>(context).state.chatWidgetAppState.pollData;

    if (!isTimerInitialized && pollData.time != 0) {
      setState(() {
        timer = pollData.time;
        isTimerInitialized = true;
      });
      _startTimer();
    }
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ChatWidgetAppState>(
      converter: (store) => store.state.chatWidgetAppState,
      builder: (context, state) {
        return SizedBox(
          height: 500,
          child: state.pollData.correctAnswers.isNotEmpty
              ? Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      const Text('Poll/Q&A'),
                      const SizedBox(height: 16),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Text(
                            '$timer',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const Text('Seconds', style: TextStyle(fontSize: 12)),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PollDetailItem(
                              label: 'Question Type',
                              value: '${state.pollData.type ?? ''}'),
                          PollDetailItem(
                              label: 'Question Number',
                              value: '${state.pollData.questionNo ?? ''}'),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PollDetailItem(
                              label: 'No. of Options',
                              value: '${state.pollData?.noOfOptions ?? ''}'),
                          PollDetailItem(
                            label: 'Correct options',
                            value: state.pollData != null
                                ? (state.pollData.correctAnswers).join(', ')
                                : '',
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 200,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  timer += 10;
                                });
                                sendPollTimeIncreaseToServer(
                                    state.pollData.questionId, 10);
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor:
                                    const Color.fromRGBO(60, 141, 188, 1),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              child: const Text('Add 10 seconds'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : const Text("no data"),
        );
      },
    );
  }
}

class PollDetailItem extends StatelessWidget {
  final String label;
  final String value;

  const PollDetailItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Container(
        child: Column(
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            Text(
              value,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
