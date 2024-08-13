import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/apiservices/models/mycourses/all_lectures_for_course_response_model.dart';
import 'package:inspflutterfrontend/base/base.dart';
import 'package:inspflutterfrontend/data/hardcoded/topic_list.dart';
import 'package:inspflutterfrontend/utils/extractFileNameFromS3URL.dart';
import 'package:inspflutterfrontend/widget/inputField/dropdown.dart';
import 'package:inspflutterfrontend/widget/inputField/picked_file.dart';
import 'package:inspflutterfrontend/widget/inputField/textfield_withoutsuffix.dart';
import 'package:inspflutterfrontend/widget/popups/assignmentPopup/add_assignment_redux.dart';

class AddAssignment extends StatelessWidget {
  const AddAssignment({super.key});

  @override
  Widget build(BuildContext context) {
    void createAssignment() {
      dispatch(context, handleCreate(context));
    }

    void updateAssignment() {
      dispatch(context, handleUpdate(context));
    }

    void uploadFile() {
      dispatch(context, pickFiles(context));
    }

    return StoreConnector<AddAssignmentAppState, AddAssignmentAppState>(
        converter: (store) => store.state,
        builder: (context, AddAssignmentAppState state) =>
            SingleChildScrollView(
                child: AlertDialog(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 26, horizontal: 28),
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
                        height: 400,
                        width: 500, // Set your desired width here
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Subject Dropdown
                              Dropdown(
                                items:
                                    subjectList.map((ChapterTopicModel item) {
                                  return DropdownMenuItem<String>(
                                    value: item.label,
                                    child: Text(item.label),
                                  );
                                }).toList(),
                                selectedValueError: state.selectedSubjectError,
                                selectedValue: state.selectedSubject!.isEmpty
                                    ? null
                                    : state.selectedSubject,
                                onChanged: (String? newValue) {
                                  dispatch(
                                      context,
                                      UpdateSelectedSubject(
                                          selectedSubject: newValue));
                                },
                                hintText: "Select Subject...",
                              ),
                              const SizedBox(height: 16.0),
                              // Topic Dropdown
                              Dropdown(
                                items: topicList.map((ChapterTopicModel item) {
                                  return DropdownMenuItem<String>(
                                    value: item.label,
                                    child: Text(item.label),
                                  );
                                }).toList(),
                                selectedValueError: state.selectedTopicError,
                                selectedValue: state.selectedTopicError!.isEmpty
                                    ? null
                                    : state.selectedTopicError,
                                onChanged: state.selectedSubject == "PHYSICS"
                                    ? (String? newValue) {
                                        dispatch(
                                            context,
                                            UpdateSelectedTopic(
                                                selectedTopic: newValue));
                                      }
                                    : null,
                                hintText: "Select topic...",
                              ),
                              const SizedBox(height: 16.0),
                              // Description TextFormField
                              TextFieldWithoutSuffix(
                                  hintText: "Description",
                                  value: state.description,
                                  onChanged: (text) {
                                    dispatch(context,
                                        UpdateDescription(description: text));
                                  },
                                  selectedValueError: state.descriptionError),

                              const SizedBox(height: 16.0),
                              // File Upload Row
                              PickedFile(
                                  uploadFile: uploadFile,
                                  removeFile: (file) {
                                    dispatch(context,
                                        RemoveFileAction(filename: file));
                                  },
                                  pickedFilesName: state.pickedFilesName),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: state.previousFiles.length,
                                itemBuilder: (context, index) {
                                  final LiveClassRoomFile file =
                                      state.previousFiles[index];
                                  return Container(
                                    margin: const EdgeInsets.all(2.0),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE3E1E1),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          extractFileNameFromS3URL(file.key),
                                          style: const TextStyle(
                                            fontSize: 15.0,
                                            color: Color(0xFF718096),
                                          ),
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.close),
                                          onPressed: () => dispatch(
                                              context,
                                              RemovePreviousAssignmentFile(
                                                  id: file.id)),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        )),
                    actions: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.20,
                          child: ElevatedButton(
                              onPressed: state.isAssignmentLoading
                                  ? null
                                  : state.isEditScreen
                                      ? updateAssignment
                                      : createAssignment,
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
                              child: state.isAssignmentLoading
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ))
                                  : Text(state.isEditScreen
                                      ? "Update Assignment"
                                      : "Schedule Assignment")),
                        ),
                      ])
                ])));
  }

  static getScreen(
      int assignmentId,
      bool isEditScreen,
      String? selectedSubject,
      String? selectedTopic,
      String? description,
      List<LiveClassRoomFile> previousFiles) {
    return getBaseScreen<AddAssignmentAppState, AddAssignment>(
        addAssignmentStateReducer,
        AddAssignmentAppState(
            assignmentId: assignmentId,
            isEditScreen: isEditScreen,
            selectedSubject: selectedSubject,
            selectedTopic: selectedTopic,
            description: description,
            previousFiles: previousFiles),
        const AddAssignment());
  }

  static dispatch(BuildContext context, dynamic action) {
    baseDispatch<AddAssignmentAppState>(context, action);
  }
}
