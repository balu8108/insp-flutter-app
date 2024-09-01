import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/pages/common/livestream/models/increase_polltime_model.dart';
import 'package:inspflutterfrontend/pages/common/livestream/models/polldata_model.dart';
import 'package:inspflutterfrontend/pages/common/livestream/widget/chat/chat_widget_redux.dart';
import 'package:inspflutterfrontend/redux/AppState.dart';
import 'package:inspflutterfrontend/widget/heading/insp_heading.dart';
import 'package:inspflutterfrontend/widget/inputField/question_dropdown.dart';

class LiveQuestionAnswer extends StatefulWidget {
  const LiveQuestionAnswer(
      {Key? key,
      required this.polldata,
      required this.increasePollTimeModel,
      required this.submitAnswer})
      : super(key: key);

  final PollDataModel polldata;
  final IncreasePollTimeModel increasePollTimeModel;
  final Function(dynamic data) submitAnswer;

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

  void updateCorrectAnswerArray(List<String> answer) {
    setState(() {
      answerOption = answer;
    });
  }

  void sendAnswer() {
    if (answerOption.isEmpty) {
      return; // Later on, you can add notification or error handling
    } else {
      // Create a data map with the required fields
      final data = {
        'answers': answerOption,
        'noOfOptions': widget.polldata.noOfOptions,
        'type': widget.polldata.type,
        'questionId': widget.polldata.questionId,
        'responseTimeInSeconds': widget.polldata.time - (timer - 5),
      };

      // Call the sendAnswerHandler function with the data
      widget.submitAnswer(data);

      setState(() {
        _isAnswerSubmitted = true;
      });
    }
  }

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

  void updateTimer(int newTime) {
    setState(() {
      timer = newTime;
    });
    startTimer(); // Restart the timer with the new value
  }

  void startTimer() {
    if (_isTimerRunning) return; // Prevent multiple timers
    _isTimerRunning = true;
    final interval = Duration(seconds: 1);

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
      startTimer();
    });
  }

  @override
  void didUpdateWidget(covariant LiveQuestionAnswer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.increasePollTimeModel != oldWidget.increasePollTimeModel) {
      updateTimer(timer +
          widget.increasePollTimeModel
              .timeIncreaseBy); // Assume newTime is the updated time
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 300,
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
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
                                          MaterialStateProperty.all(
                                              const Color(0xFF3C8DBC)),
                                      foregroundColor:
                                          MaterialStateProperty.all(
                                              const Color(0xFF3C8DBC)),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              8.0), // Adjust border radius as needed
                                        ),
                                      ),
                                      padding: MaterialStateProperty.all(
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
