import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/pages/common/livestream/widget/chat/chat_widget_redux.dart';
import 'package:insp/pages/common/livestream/widget/chat/poll_timer_redux.dart';
import 'package:insp/redux/AppState.dart';
import 'package:insp/socket/mainsocket.dart';

class PollTimer extends StatefulWidget {
  const PollTimer({super.key});

  @override
  _PollTimerState createState() => _PollTimerState();
}

class _PollTimerState extends State<PollTimer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ChatWidgetAppState>(
      converter: (store) => store.state.chatWidgetAppState,
      builder: (context, state) {
        if (state.pollData.correctAnswers.isEmpty) {
          return const Text("No data");
        }

        return Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const Text('Poll/Q&A'),
              const SizedBox(height: 16),
              _buildTimerDisplay(),
              const SizedBox(height: 15),
              _buildPollDetails(state.pollData),
              const SizedBox(height: 15),
              _buildAddTimeButton(state.pollData.questionId),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTimerDisplay() {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(100),
        ),
        child: StoreConnector<AppState, PollTimerAppState>(
          converter: (store) => store.state.pollTimerAppState,
          builder: (context, state) {
            return Text(
              '${state.timer}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPollDetails(dynamic pollData) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PollDetailItem(label: 'Question Type', value: pollData.type ?? ''),
            PollDetailItem(
                label: 'Question Number',
                value: '${pollData.questionNo ?? ''}'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PollDetailItem(
                label: 'No. of Options',
                value: '${pollData.noOfOptions ?? ''}'),
            PollDetailItem(
              label: 'Correct options',
              value: pollData.correctAnswers.join(', '),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAddTimeButton(String questionId) {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        onPressed: () {
          StoreProvider.of<AppState>(context).dispatch(increase());
          sendPollTimeIncreaseToServer(questionId, 10);
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromRGBO(60, 141, 188, 1),
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        child: const Text('Add 10 seconds'),
      ),
    );
  }
}

class PollDetailItem extends StatelessWidget {
  final String label;
  final String value;

  const PollDetailItem({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Column(
        children: [
          Text(label,
              style:
                  const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          Text(
            value,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
