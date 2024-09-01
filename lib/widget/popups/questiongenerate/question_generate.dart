import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/base/base.dart';
import 'package:inspflutterfrontend/pages/common/livestream/models/polldata_model.dart';
import 'package:inspflutterfrontend/widget/inputField/question_dropdown.dart';
import 'package:inspflutterfrontend/widget/inputField/textfield.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/data/hardcoded/topic_list.dart';
import 'package:inspflutterfrontend/widget/inputField/dropdown.dart';
import 'package:inspflutterfrontend/widget/popups/questiongenerate/question_generate_redux.dart';

class QuestionGenerate extends StatelessWidget {
  const QuestionGenerate({
    Key? key,
    required this.sendPollToServer,
  }) : super(key: key);

  final Function(PollDataModel) sendPollToServer;

  @override
  Widget build(BuildContext context) {
    void createAssignment() {
      dispatch(context, questionGenerateapi(context, sendPollToServer));
    }

    void updateCorrectAnswerArray(List<String> answer) {
      dispatch(context, UpdateCorrectAnswers(correctAnswers: answer));
    }

    return StoreConnector<QuestionGenerateAppState, QuestionGenerateAppState>(
        converter: (store) => store.state,
        builder: (context, QuestionGenerateAppState state) => AlertDialog(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                title: Row(
                  children: [
                    const Text("Polls/MCQ/TF",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        )),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                    ),
                  ],
                ),
                content: Container(
                  height: 350,
                  width: 200, // Set your desired width here
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Subject Dropdown
                        Dropdown(
                          items: pollList.map((ChapterTopicModel item) {
                            return DropdownMenuItem<String>(
                              value: item.value,
                              child: Text(item.label),
                            );
                          }).toList(),
                          selectedValueError: state.questionTypeError,
                          selectedValue: state.questionType!.isEmpty
                              ? null
                              : state.questionType,
                          onChanged: (newValue) {
                            dispatch(context,
                                UpdateQuestionType(questionType: newValue));
                            dispatch(
                                context,
                                updateDropdownItems(
                                    context, state.noOfOptions.toString()));
                            if (newValue == 'tf') {
                              dispatch(
                                  context, UpdateNoOfOptions(noOfOptions: 2));
                            }
                          },
                          hintText: "Select Subject...",
                        ),
                        const SizedBox(height: 16.0),

                        TextFieldDefault(
                          hintText: "Enter question no",
                          selectedValue: state.questionNo != null
                              ? state.questionNo.toString()
                              : '',
                          selectedValueError: state.questionNoError,
                          onChanged: (text) {
                            dispatch(
                                context,
                                UpdateQuestionNo(
                                    questionNo: int.tryParse(text)));
                          },
                        ),
                        const SizedBox(height: 16.0),
                        TextFieldDefault(
                          hintText: "Enter timer in seconds",
                          selectedValue:
                              state.time != null ? state.time.toString() : '',
                          selectedValueError: state.timeError,
                          onChanged: (text) {
                            dispatch(
                                context, UpdateTime(time: int.tryParse(text)));
                          },
                        ),
                        const SizedBox(height: 16.0),
                        TextFieldDefault(
                          hintText: "Select no. of options",
                          selectedValue: state.noOfOptions != null
                              ? state.noOfOptions.toString()
                              : '',
                          selectedValueError: state.noOfOptionsError,
                          enableText: state.questionType == 'tf' ? false : true,
                          onChanged: (text) {
                            dispatch(
                                context, updateDropdownItems(context, text));
                            dispatch(
                                context,
                                UpdateNoOfOptions(
                                    noOfOptions: int.tryParse(text)));
                          },
                        ),
                        const SizedBox(height: 16.0),
                        const Text("Select correct answer"),
                        const SizedBox(height: 5.0),
                        // Subject Dropdown
                        QuestionOption(
                            questionType: state.questionType!,
                            noOfOption: state.noOfOptions ?? 0,
                            optionArray: state.dropdownItem,
                            updateCorrectAnswerArray: updateCorrectAnswerArray),
                      ],
                    ),
                  ),
                ),
                actions: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.20,
                          child: ElevatedButton(
                              onPressed: createAssignment,
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor:
                                    const Color.fromRGBO(60, 141, 188, 1),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              child: const Text("Send")),
                        ),
                      ])
                ]));
  }

  static getScreen({required Function(PollDataModel) sendPollToServer}) {
    return getBaseScreen<QuestionGenerateAppState, QuestionGenerate>(
      questionGenerateStateReducer,
      const QuestionGenerateAppState(),
      QuestionGenerate(sendPollToServer: sendPollToServer),
    );
  }

  static dispatch(BuildContext context, dynamic action) {
    baseDispatch<QuestionGenerateAppState>(context, action);
  }
}
