import 'package:flutter/material.dart';

class AddAssignment extends StatefulWidget {
  const AddAssignment({Key? key}) : super(key: key);

  @override
  _AddAssignmentState createState() => _AddAssignmentState();
}

class _AddAssignmentState extends State<AddAssignment> {
  List<String> subjectItems = ["CHEMISTRY", "MATHEMATICS", "PHYSICS"];
  List<String> topicItems = ["TOPIC 1", "TOPIC 2", "TOPIC 3"];
  String? selectedSubject;
  String? selectedTopic;
  String? additionalFieldValue;
  String? fileName; // To store the name of the selected file

  void _handleCreate() {
    // Your create logic here
  }

  void _selectFile() {
    // Implement file selection logic here
    // Example:
    setState(() {
      fileName = "example_file.txt"; // Set the file name after selection
    });
  }

  void _uploadFile() {
    // Implement file upload logic here
    // Example:
    print("Uploading file: $fileName");
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 26, horizontal: 28),
      title: Row(
        children: [
          const Text("Assignment",
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
        width: 500, // Set your desired width here
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Subject Dropdown
            Container(
              width: double.infinity, // Full width
              child: DropdownButtonFormField<String>(
                hint: const Text(
                  "Select Subject",
                  style: TextStyle(
                      color: Color.fromRGBO(58, 53, 65, 0.38),
                      fontWeight: FontWeight.w400),
                ),
                value: selectedSubject,
                items: subjectItems.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedSubject = newValue;
                  });
                },
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(58, 53, 65, 0.38),
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(58, 53, 65, 0.38),
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(58, 53, 65, 0.38),
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),

            // Topic Dropdown
            Container(
              width: double.infinity,
              child: DropdownButtonFormField<String>(
                hint: Text("Select Topic",
                    style: TextStyle(
                        color: Color.fromRGBO(58, 53, 65, 0.38),
                        fontWeight: FontWeight.w400)),
                value: selectedTopic,
                items: topicItems.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedTopic = newValue;
                  });
                },
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(58, 53, 65, 0.38),
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(58, 53, 65, 0.38),
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(58, 53, 65, 0.38),
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),

            // Description TextFormField
            TextFormField(
              maxLines: 2,
              decoration: InputDecoration(
                hintText: "Description",
                hintStyle: TextStyle(
                    color: Color.fromRGBO(58, 53, 65, 0.38),
                    fontWeight: FontWeight.w400),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(58, 53, 65, 0.38),
                    width: 1.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(58, 53, 65, 0.38),
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(58, 53, 65, 0.38),
                    width: 1.0,
                  ),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
              ),
            ),
            SizedBox(height: 16.0),

            // File Upload Row
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: fileName ?? "Files to upload",
                      hintStyle: TextStyle(
                          color: Color.fromRGBO(58, 53, 65, 0.38),
                          fontWeight: FontWeight.w400),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(58, 53, 65, 0.38),
                          width: 1.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(58, 53, 65, 0.38),
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(58, 53, 65, 0.38),
                          width: 1.0,
                        ),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: _selectFile,
                  child: Text("Select Files"),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color.fromRGBO(60, 141, 188, 1),
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    minimumSize: const Size(100, 50.0),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),

            // Upload Button
            ElevatedButton(
              onPressed: _uploadFile,
              child: Text("Upload"),
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
