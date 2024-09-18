import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/pages/common/livestream/models/increase_polltime_model.dart';
import 'package:insp/pages/common/livestream/models/polldata_model.dart';
import 'package:insp/pages/common/livestream/widget/chat/chat_widget_redux.dart';
import 'package:insp/redux/AppState.dart';
import 'package:insp/socket/mainsocket.dart';
import 'package:insp/widget/heading/insp_heading.dart';
import 'package:insp/widget/inputField/question_dropdown.dart';

class LiveQuestionAnswer extends StatefulWidget {
  const LiveQuestionAnswer(
      {super.key,
      required this.polldata,
      required this.increasePollTimeModel,
      required this.closedDialog});

  final PollDataModel polldata;
  final IncreasePollTimeModel increasePollTimeModel;
  final Function() closedDialog;

  @override
  _PollTimerState createState() => _PollTimerState();
}

class _PollTimerState extends State<LiveQuestionAnswer> {
  int timer = 0;
  List<String> dropdownOption = [];
  List<String> answerOption = [];
  bool _isTimerRunning = false;
  bool _isAnswerSubmitted = false;
  bool _showAnswer = false;

  // Update the selected answers
  void updateCorrectAnswerArray(List<String> answer) {
    setState(() {
      answerOption = answer;
    });
  }

  // Handle sending the answer
  void sendAnswer() {
    if (answerOption.isEmpty) {
      return; // Add error handling or a notification
    } else {
      final data = {
        'answers': answerOption,
        'noOfOptions': widget.polldata.noOfOptions,
        'type': widget.polldata.type,
        'questionId': widget.polldata.questionId,
        'responseTimeInSeconds': widget.polldata.time - (timer - 5),
      };

      sendAnswerHandler(data);
      setState(() {
        _isAnswerSubmitted = true;
      });
    }
  }

  // Update dropdown items based on poll type
  void updateDropdownItems() {
    try {
      if (widget.polldata.type.isNotEmpty) {
        if (widget.polldata.type == 'mcq' || widget.polldata.type == 'poll') {
          final List<String> alphabets = List.generate(
              10, (index) => String.fromCharCode(65 + index)); // A to J
          int value = widget.polldata.noOfOptions;
          if (value > 0) {
            setState(() {
              dropdownOption = alphabets;
            });
          } else {
            setState(() {
              dropdownOption = [];
            });
          }
        }
        if (widget.polldata.type == 'tf') {
          setState(() {
            dropdownOption = ['true', 'false'];
          });
        }
      }
    } catch (error) {
      print(error);
    }
  }

  // Update the timer with the new value
  void updateTimer(int newTime) {
    setState(() {
      timer = newTime;
    });
    startTimer(); // Restart the timer with the updated time
  }

  // Start the countdown timer
  void startTimer() {
    if (_isTimerRunning) return; // Prevent multiple timers
    _isTimerRunning = true;
    const interval = Duration(seconds: 1);

    Future.doWhile(() async {
      await Future.delayed(interval);
      if (timer == 5) {
        setState(() {
          _showAnswer = true;
        });
      }
      if (timer == 0) {
        StoreProvider.of<AppState>(context)
            .dispatch(cleanQuestionState()); // Redux action
        _isTimerRunning = false;
        widget.closedDialog();
        return false;
      } else {
        setState(() {
          timer -= 1;
        });
        return true;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    updateDropdownItems();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        timer = widget.polldata.time + 5;
      });
      startTimer(); // Start the timer after initial setup
    });
  }

  @override
  void didUpdateWidget(covariant LiveQuestionAnswer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.increasePollTimeModel != oldWidget.increasePollTimeModel) {
      updateTimer(timer +
          widget.increasePollTimeModel
              .timeIncreaseBy); // Update timer if poll time is increased
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 300,
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(
                255, 205, 228, 247), // Set the border color
            width: 2.0, // Set the border width
          ),
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromRGBO(232, 242, 249, 1),
        ),
        child: _showAnswer
            ? SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex: 9, child: INSPHeading("Correct answer is")),
                          Text('$timer s')
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(widget.polldata.correctAnswers.join(','))
                    ]))
            : SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            flex: 9,
                            child: INSPHeading(widget.polldata.type == 'tf'
                                ? 'True/False'
                                : widget.polldata.type)),
                        Text('${timer - 5} s')
                      ],
                    ),
                    const SizedBox(height: 10),
                    _isAnswerSubmitted
                        ? const Text("Answer will display after poll end.")
                        : Column(
                            children: [
                              QuestionOption(
                                questionType: widget.polldata.type,
                                noOfOption: widget.polldata.noOfOptions,
                                optionArray: dropdownOption,
                                updateCorrectAnswerArray:
                                    updateCorrectAnswerArray,
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                  width: double.infinity,
                                  height: 39,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          WidgetStateProperty.all(
                                              const Color(0xFF3C8DBC)),
                                      foregroundColor:
                                          WidgetStateProperty.all(
                                              const Color(0xFF3C8DBC)),
                                      shape: WidgetStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              8.0), // Adjust border radius as needed
                                        ),
                                      ),
                                      padding: WidgetStateProperty.all(
                                          const EdgeInsets.symmetric(
                                              vertical: 12.0)),
                                    ),
                                    onPressed: () {
                                      sendAnswer();
                                    },
                                    child: const Text(
                                      'Submit',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ))
                            ],
                          )
                  ],
                )));
  }
}
