import 'package:flutter/material.dart';

class QuestionOption extends StatefulWidget {
  final String questionType; // 'poll' or 'mcq' or 'tf'
  final int noOfOption; // Number of options
  final List<String> optionArray; // List of options
  final Function(List<String>) updateCorrectAnswerArray;

  QuestionOption({
    required this.questionType,
    required this.noOfOption,
    required this.optionArray,
    required this.updateCorrectAnswerArray,
  });

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
    _initializeCheckboxValues();
    _selectedRadio = "";
  }

  @override
  void didUpdateWidget(covariant QuestionOption oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.noOfOption != widget.noOfOption) {
      _initializeCheckboxValues();
    }
  }

  void _initializeCheckboxValues() {
    _checkboxValues = List.generate(widget.noOfOption, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return _buildQuestionOptions();
  }

  Widget _buildQuestionOptions() {
    int optionCount = widget.optionArray.length < widget.noOfOption
        ? widget.optionArray.length
        : widget.noOfOption;

    if (widget.questionType == 'poll') {
      return _checkboxValues.length > 10
          ? const Text("Options should we less then 10")
          : Column(
              children: List.generate(optionCount, (index) {
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
              }),
            );
    } else if (widget.questionType == 'mcq') {
      return _checkboxValues.length > 10
          ? const Text("Options should we less then 10")
          : Column(
              children: List.generate(optionCount, (index) {
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
                  },
                );
              }),
            );
    } else if (widget.questionType == 'tf') {
      return Column(
        children: List.generate(2, (index) {
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
            },
          );
        }),
      );
    } else {
      return Center(child: Text('Invalid question type'));
    }
  }
}
