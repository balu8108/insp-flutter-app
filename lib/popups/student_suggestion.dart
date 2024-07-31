import 'package:flutter/material.dart';

class StudentSuggestion extends StatefulWidget {
  const StudentSuggestion({Key? key}) : super(key: key);

  @override
  _StudentSuggestionState createState() => _StudentSuggestionState();
}

class _StudentSuggestionState extends State<StudentSuggestion> {
  final TextEditingController _feedbackController = TextEditingController();
  String? _errorFeedback;

  void _handleSubmit() {
    // Implement your submit logic here
    print("Feedback submitted: ${_feedbackController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0), // Set border radius here
      ),
      contentPadding: const EdgeInsets.all(16.0),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Suggestion",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
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
            TextFormField(
              controller: _feedbackController,
              maxLines: 6,
              decoration: InputDecoration(
                hintText: "Suggestion",
                hintStyle: TextStyle(color: Color.fromRGBO(58, 53, 65, 0.38)),
                errorText: _errorFeedback,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(
                        58, 53, 65, 0.38), // Default border color
                    width: 1.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: BorderSide(
                    color: Color.fromRGBO(
                        58, 53, 65, 0.38), // Enabled border color
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: BorderSide(
                    color: Color.fromRGBO(
                        58, 53, 65, 0.38), // Focused border color
                    width: 1.0,
                  ),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _handleSubmit,
              child: Text("Submit"),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color.fromRGBO(60, 141, 188, 1),
                padding: EdgeInsets.symmetric(vertical: 16.0),
                textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                minimumSize: const Size(251, 50.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
