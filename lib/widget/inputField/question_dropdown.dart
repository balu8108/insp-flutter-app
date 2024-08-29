import 'package:flutter/material.dart';

class QuestionOption extends StatefulWidget {
  final String questionType; // 'poll' or 'mcq'
  final int noOfOption; // Number of options
  final List<String> optionArray; // List of options
  final Function(List<String>) updateCorrectAnswerArray;

  QuestionOption(
      {required this.questionType,
      required this.noOfOption,
      required this.optionArray,
      required this.updateCorrectAnswerArray});

  @override
  _QuestionOptionState createState() => _QuestionOptionState();
}

class _QuestionOptionState extends State<QuestionOption> {
  late List<bool> _checkboxValues;
  String? _selectedRadio;
  List<String> checkboxData = [];
  List<String> trueFalseData = ['true', 'false'];

  @override
  void initState() {
    super.initState();
    _checkboxValues = List.generate(widget.noOfOption, (index) => false);
    _selectedRadio = "";
  }

  @override
  Widget build(BuildContext context) {
    return _buildQuestionOptions();
  }

  Widget _buildQuestionOptions() {
    if (widget.optionArray.isNotEmpty) {
      if (widget.questionType == 'poll') {
        return SizedBox(
          height: 250,
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            itemCount: widget.noOfOption,
            itemBuilder: (BuildContext context, int index) {
              return CheckboxListTile(
                activeColor: const Color.fromRGBO(60, 141, 188, 1),
                title: Text(
                  widget.optionArray[index],
                  style: const TextStyle(fontSize: 14),
                ),
                value: _checkboxValues[index],
                onChanged: (bool? value) {
                  setState(() {
                    _checkboxValues[index] = value ?? false;
                  });
                  checkboxData.add(widget.optionArray[index]);
                  widget.updateCorrectAnswerArray(checkboxData);
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 10,
              );
            },
          ),
        );
      } else if (widget.questionType == 'mcq') {
        return SizedBox(
          height: 200,
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            itemCount: widget.noOfOption,
            itemBuilder: (BuildContext context, int index) {
              return RadioListTile<String>(
                  activeColor: const Color.fromRGBO(60, 141, 188, 1),
                  title: Text(widget.optionArray[index]),
                  value: widget.optionArray[index],
                  groupValue: _selectedRadio,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedRadio = value;
                    });
                    widget.updateCorrectAnswerArray([value!]);
                  });
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 10,
              );
            },
          ),
        );
      } else if (widget.questionType == 'tf') {
        return SizedBox(
          height: 200,
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              return RadioListTile<String>(
                  activeColor: const Color.fromRGBO(60, 141, 188, 1),
                  title: Text(trueFalseData[index]),
                  value: trueFalseData[index],
                  groupValue: _selectedRadio,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedRadio = value;
                    });
                    widget.updateCorrectAnswerArray([value!]);
                  });
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 10,
              );
            },
          ),
        );
      } else {
        return Center(child: Text('Invalid question type 2'));
      }
    } else {
      return Center(child: Text('Invalid question type'));
    }
  }
}
