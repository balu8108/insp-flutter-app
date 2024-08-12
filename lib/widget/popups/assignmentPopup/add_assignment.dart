import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/base/base.dart';
import 'package:inspflutterfrontend/data/hardcoded/topic_list.dart';
import 'package:inspflutterfrontend/widget/popups/assignmentPopup/add_assignment_redux.dart';

class AddAssignment extends StatelessWidget {
  const AddAssignment({super.key});

  @override
  Widget build(BuildContext context) {
    void createAssignment() {
      dispatch(context, handleCreate(context));
    }

    void uploadFile() {
      dispatch(context, pickFiles(context));
    }

    return StoreConnector<AddAssignmentAppState, AddAssignmentAppState>(
        converter: (store) => store.state,
        builder: (context, AddAssignmentAppState state) => AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 26, horizontal: 28),
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
                        dropdownColor: Colors.white,
                        hint: const Text(
                          "Select Subject",
                          style: TextStyle(
                              color: Color.fromRGBO(58, 53, 65, 0.38),
                              fontWeight: FontWeight.w400),
                        ),
                        // value: state.selectedSubject,
                        items: subjectList.map((ChapterTopicModel item) {
                          return DropdownMenuItem<String>(
                            value: item.label,
                            child: Text(item.label),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          dispatch(context,
                              UpdateSelectedSubject(selectedSubject: newValue));
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 12.0),
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
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    // Topic Dropdown
                    Container(
                      width: double.infinity,
                      child: DropdownButtonFormField<String>(
                        hint: const Text("Select Topic",
                            style: TextStyle(
                                color: Color.fromRGBO(58, 53, 65, 0.38),
                                fontWeight: FontWeight.w400)),
                        // value: state.selectedTopic,
                        items: topicList.map((ChapterTopicModel item) {
                          return DropdownMenuItem<String>(
                            value: item.label,
                            child: Text(item.label),
                          );
                        }).toList(),
                        onChanged: state.selectedSubject == "PHYSICS"
                            ? (String? newValue) {
                                dispatch(
                                    context,
                                    UpdateSelectedTopic(
                                        selectedTopic: newValue));
                              }
                            : null,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 12.0),
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
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    // Description TextFormField
                    TextFormField(
                      maxLines: 2,
                      onChanged: (text) {
                        dispatch(context, UpdateDescription(description: text));
                      },
                      decoration: InputDecoration(
                        hintText: "Description",
                        hintStyle: const TextStyle(
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
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 12.0),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    // File Upload Row
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: "Files to upload",
                              hintStyle: const TextStyle(
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
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 12.0),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        ElevatedButton(
                          onPressed: uploadFile,
                          child: const Text("Select Files"),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor:
                                const Color.fromRGBO(60, 141, 188, 1),
                            textStyle: const TextStyle(
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
                    const SizedBox(height: 4.0),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.pickedFilesName.length,
                      itemBuilder: (context, index) {
                        final file = state.pickedFilesName[index];
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
                                file,
                                style: const TextStyle(
                                  fontSize: 15.0,
                                  color: Color(0xFF718096),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () {
                                  dispatch(context,
                                      RemoveFileAction(filename: file));
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 16.0),

                    // Upload Button
                    ElevatedButton(
                      onPressed: createAssignment,
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
                      child: Text("Upload"),
                    ),
                  ],
                ),
              ),
            ));
  }

  static getScreen() {
    return getBaseScreen<AddAssignmentAppState, AddAssignment>(
        addAssignmentStateReducer,
        const AddAssignmentAppState(),
        const AddAssignment());
  }

  static dispatch(BuildContext context, dynamic action) {
    baseDispatch<AddAssignmentAppState>(context, action);
  }
}
