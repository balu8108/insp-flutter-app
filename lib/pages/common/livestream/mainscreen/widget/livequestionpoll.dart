import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/pages/common/livestream/widget/chat/chat_widget_redux.dart';
import 'package:inspflutterfrontend/redux/AppState.dart';
import 'package:inspflutterfrontend/socket/mainsocket.dart';
import 'package:redux/redux.dart';

class PollTimer extends StatefulWidget {
  PollTimer();

  @override
  _PollTimerState createState() => _PollTimerState();
}

class _PollTimerState extends State<PollTimer> {
  int timer = 0;

  @override
  void initState() {
    super.initState();

    // Initialize timer with the poll data time
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final pollData =
          StoreProvider.of<AppState>(context).state.chatWidgetAppState.pollData;
      setState(() {
        timer = pollData.time;
      });
      startTimer();
    });
  }

  void startTimer() {
    final interval = Duration(seconds: 1);
    Future.delayed(interval, () {
      if (timer > 0) {
        setState(() {
          timer -= 1;
        });
        startTimer();
      } else {
        StoreProvider.of<AppState>(context)
            .dispatch(cleanState()); // Redux action
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final pollData =
        StoreProvider.of<AppState>(context).state.chatWidgetAppState.pollData;

    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          const Text('Poll/Q&A'),
          const SizedBox(height: 16),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Text(
                '$timer',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Text(
            'Seconds',
            style: TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PollDetailItem(
                label: 'Question Type',
                value: '${pollData.type}',
              ),
              PollDetailItem(
                label: 'Question Number',
                value: '${pollData.questionNo}',
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PollDetailItem(
                label: 'No. of Options',
                value: '${pollData.noOfOptions}',
              ),
              PollDetailItem(
                label: 'Correct options',
                value: (pollData.correctAnswers).join(', '),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Container(
              width: 200,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      timer += 10;
                    });
                    sendPollTimeIncreaseToServer(pollData.questionId, 10);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromRGBO(60, 141, 188, 1),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  child: const Text('Add 10 seconds')),
            ),
          ])
        ],
      ),
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
        )));
  }
}
