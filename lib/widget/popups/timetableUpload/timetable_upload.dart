import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:inspflutterfrontend/widget/inputField/picked_file.dart';

class TimetableUpload extends StatefulWidget {
  const TimetableUpload({super.key});

  @override
  _TimetableUploadState createState() => _TimetableUploadState();
}

class _TimetableUploadState extends State<TimetableUpload> {
  List<String> selectedFiles = [];

  void _chooseFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result != null) {
      setState(() {
        selectedFiles = result.paths.map((path) {
          return path ?? '';
        }).toList();
      });
    }
  }

  void _removeFile(String file) {
    setState(() {
      selectedFiles.remove(file);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      title: const Text(
        'Upload Time Table',
        style: TextStyle(
            color: Color.fromRGBO(58, 53, 65, 0.87),
            fontSize: 24,
            fontWeight: FontWeight.w500),
      ),
      content: SizedBox(
        width: 550,
        height:
            300, // Adjusted height to accommodate both picked and previous files
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                // Box to display selected files
                Expanded(
                  child: Container(
                    height: 45,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromRGBO(58, 53, 65, 0.23)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: selectedFiles.isEmpty
                        ? const Text('Files to upload',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(58, 53, 65, 0.38),
                            ))
                        : SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: selectedFiles.map((file) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Chip(
                                    label: Text(
                                      file.split('/').last,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    avatar: const Icon(Icons.insert_drive_file),
                                    onDeleted: () {
                                      _removeFile(file);
                                    },
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                  ),
                ),
                const SizedBox(width: 10),
                // Button to choose files
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF3C8DBC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: _chooseFile,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                    child: const Text(
                      'Choose File',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Integrate PickedFile component
            PickedFile(
              uploadFile: _chooseFile,
              removeFile: _removeFile,
              pickedFilesName: selectedFiles,
            ),
            const SizedBox(height: 10),
            // Previous files list
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: selectedFiles.length,
                itemBuilder: (context, index) {
                  final String file = selectedFiles[index];
                  return Container(
                    margin: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE3E1E1),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          file.split('/').last,
                          style: const TextStyle(
                            fontSize: 15.0,
                            color: Color(0xFF718096),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => _removeFile(file),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        Center(
          child: SizedBox(
            width: 200,
            height: 47,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFF3C8DBC),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const Text(
                'Upload',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              onPressed: () {
                // Handle the file upload logic here
                Navigator.of(context).pop(); // Dismiss the dialog
              },
            ),
          ),
        ),
      ],
    );
  }
}
