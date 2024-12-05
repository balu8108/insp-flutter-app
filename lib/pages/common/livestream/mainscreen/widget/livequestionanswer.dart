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
  const LiveQuestionAnswer({
    Key? key,
    required this.polldata,
    required this.increasePollTimeModel,
  }) : super(key: key);

  final PollDataModel polldata;
  final IncreasePollTimeModel increasePollTimeModel;

  @override
  _LiveQuestionAnswerState createState() => _LiveQuestionAnswerState();
}

class _LiveQuestionAnswerState extends State<LiveQuestionAnswer> {
  int timer = 0;
  List<String> dropdownOption = [];
  List<String> answerOption = [];
  bool _isTimerRunning = false;
  bool _isAnswerSubmitted = false;
  bool _showAnswer = false;

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
      updateTimer(timer + widget.increasePollTimeModel.timeIncreaseBy);
    }
  }

  void updateCorrectAnswerArray(List<String> answer) {
    setState(() {
      answerOption = answer;
    });
  }

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

      sendAnswerHandler(data); // Make sure `sendAnswerHandler` is defined
      setState(() {
        _isAnswerSubmitted = true;
      });
    }
  }

  void updateDropdownItems() {
    if (widget.polldata.type.isNotEmpty) {
      if (widget.polldata.type == 'mcq' || widget.polldata.type == 'poll') {
        final List<String> alphabets = List.generate(
            10, (index) => String.fromCharCode(65 + index)); // A to J
        setState(() {
          dropdownOption = alphabets.sublist(0, widget.polldata.noOfOptions);
        });
      } else if (widget.polldata.type == 'tf') {
        setState(() {
          dropdownOption = ['true', 'false'];
        });
      }
    }
  }

  void updateTimer(int newTime) {
    setState(() {
      timer = newTime;
    });
    startTimer();
  }

  void startTimer() {
    if (_isTimerRunning) return;
    _isTimerRunning = true;
    const interval = Duration(seconds: 1);

    Future.doWhile(() async {
      await Future.delayed(interval);
      if (!mounted) return false;
      if (timer == 5) {
        setState(() {
          _showAnswer = true;
        });
      }
      if (timer == 0) {
        StoreProvider.of<AppState>(context).dispatch(cleanQuestionState());
        _isTimerRunning = false;
        Navigator.of(context).pop();
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
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 205, 228, 247),
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(16),
        color: const Color.fromRGBO(232, 242, 249, 1),
      ),
      child: _showAnswer
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(flex: 9, child: INSPHeading("Correct answer is")),
                    Text('$timer s'),
                  ],
                ),
                const SizedBox(height: 10),
                Text(widget.polldata.correctAnswers.join(',')),
              ],
            )
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
                            : widget.polldata.type),
                      ),
                      Text('${timer - 5} s'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  _isAnswerSubmitted
                      ? const Text("Answer will display after poll ends.")
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
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color(0xFF3C8DBC)),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                                onPressed: sendAnswer,
                                child: const Text(
                                  'Submit',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                ],
              )),
    );
  }
}
