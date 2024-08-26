import 'package:flutter/material.dart';

class LiveQuestion extends StatelessWidget {
  // final Function(BuildContext, RecordingPlayerCard) onViewDetailsClicked;

  LiveQuestion();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromRGBO(232, 242, 249, 1),
        ),
        child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "No Question",
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(44, 51, 41, 0.47),
                  height: 1.75,
                ),
              ),
            ]));
  }
}
