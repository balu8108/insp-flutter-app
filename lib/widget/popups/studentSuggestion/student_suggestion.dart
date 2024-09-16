import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/base/base.dart';
import 'package:insp/widget/inputField/textfield_withoutsuffix.dart';
import 'package:insp/widget/popups/studentSuggestion/student_suggestion_redux.dart';

class StudentSuggestion extends StatelessWidget {
  const StudentSuggestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void createSuggestion() {
      dispatch(context, studentSuggestionapi(context));
    }

    return StoreConnector<StudentSuggestionAppState, StudentSuggestionAppState>(
        converter: (store) => store.state,
        builder: (context, StudentSuggestionAppState state) =>
            SingleChildScrollView(
                child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(6.0), // Set border radius here
              ),
              contentPadding: const EdgeInsets.all(16.0),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Suggestion",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                  ),
                ],
              ),
              content: Container(
                width: 500, // Set your desired width here
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFieldWithoutSuffix(
                        hintText: "Suggestion",
                        value: state.feedback,
                        onChanged: (text) {
                          dispatch(context, UpdateFeedback(feedback: text));
                        },
                        selectedValueError: state.feedbackError),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: createSuggestion,
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
                        minimumSize: const Size(251, 50.0),
                      ),
                      child: const Text("Submit"),
                    ),
                  ],
                ),
              ),
            )));
  }

  static getScreen() {
    return getBaseScreen<StudentSuggestionAppState, StudentSuggestion>(
        studentSuggestionStateReducer,
        const StudentSuggestionAppState(),
        const StudentSuggestion());
  }

  static dispatch(BuildContext context, dynamic action) {
    baseDispatch<StudentSuggestionAppState>(context, action);
  }
}
