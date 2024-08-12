import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/base/base.dart';
import 'package:inspflutterfrontend/data/hardcoded/topic_list.dart';
import 'package:inspflutterfrontend/widget/inputField/dropdown.dart';
import 'package:inspflutterfrontend/widget/popups/scheduleLiveclass/schedule_liveclass_redux.dart';

class ScheduleLiveClass extends StatelessWidget {
  const ScheduleLiveClass({super.key});

  @override
  Widget build(BuildContext context) {
    void createAssignment() {
      dispatch(context, handleCreateLiveClass(context));
    }

    void uploadFile() {
      dispatch(context, pickFilesforliveclass(context));
    }

    DateTime selectedDate = DateTime.now();

    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2015, 8),
          lastDate: DateTime(2101));
      if (picked != null && picked != selectedDate) {
        dispatch(context,
            UpdateLiveClassSelectedDate(selectedDate: picked.toString()));
      }
    }

    return StoreConnector<ScheduleLiveclassAppState, ScheduleLiveclassAppState>(
        converter: (store) => store.state,
        builder: (context, ScheduleLiveclassAppState state) => AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 26, horizontal: 28),
              title: Row(
                children: [
                  const Text("Schedule Class",
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
                    Dropdown(
                      items: subjectList.map((ChapterTopicModel item) {
                        return DropdownMenuItem<String>(
                          value: item.label,
                          child: Text(item.label),
                        );
                      }).toList(),
                      selectedValue: state.selectedSubject!.isEmpty
                          ? null
                          : state.selectedSubject,
                      onChanged: (String? newValue) {
                        dispatch(
                            context,
                            UpdateLiveClassSelectedSubject(
                                selectedSubject: newValue));
                      },
                      hintText: "Select Subject...",
                    ),
                    const SizedBox(height: 16.0),
                    // Class level Dropdown
                    Dropdown(
                      items: classLevel.map((ChapterTopicModel item) {
                        return DropdownMenuItem<String>(
                          value: item.label,
                          child: Text(item.label),
                        );
                      }).toList(),
                      selectedValue: state.selectedClassLevel!.isEmpty
                          ? null
                          : state.selectedClassLevel,
                      onChanged: (String? newValue) {
                        dispatch(
                            context,
                            UpdateLiveClassSelectedClassLevel(
                                selectedClassLevel: newValue));
                      },
                      hintText: "Select class level...",
                    ),
                    const SizedBox(height: 16.0),
                    // Chapter Dropdown
                    Dropdown(
                      items: chapter.map((ChapterTopicModel item) {
                        return DropdownMenuItem<String>(
                          value: item.label,
                          child: Text(item.label),
                        );
                      }).toList(),
                      selectedValue: state.selectedChapter!.isEmpty
                          ? null
                          : state.selectedChapter,
                      onChanged: (String? newValue) {
                        dispatch(context,
                            showTopicsforLiveClassByChapter(context, newValue));
                      },
                      hintText: "Select chapter...",
                    ),
                    const SizedBox(height: 16.0),
                    // topic Dropdown
                    Dropdown(
                      items: state.allTopics.map((ChapterTopicModel item) {
                        return DropdownMenuItem<String>(
                          value: item.label,
                          child: Text(item.label),
                        );
                      }).toList(),
                      selectedValue: state.selectedTopic!.isEmpty
                          ? null
                          : state.selectedTopic,
                      onChanged: (String? newValue) {
                        dispatch(context,
                            UpdateSelectedTopic(selectedTopic: newValue));
                      },
                      hintText: "Select topic...",
                    ),
                    const SizedBox(height: 16.0),
                    // classType Dropdown
                    Dropdown(
                      items: classType.map((ChapterTopicModel item) {
                        return DropdownMenuItem<String>(
                          value: item.label,
                          child: Text(item.label),
                        );
                      }).toList(),
                      selectedValue: state.selectedCourseType!.isEmpty
                          ? null
                          : state.selectedCourseType,
                      onChanged: (String? newValue) {
                        dispatch(
                            context,
                            UpdateLiveClassSelectedCourseType(
                                selectedCourseType: newValue));
                      },
                      hintText: "Select course type...",
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      maxLines: 2,
                      onChanged: (text) {
                        dispatch(context, UpdateLiveClassAgenda(agenda: text));
                      },
                      decoration: InputDecoration(
                        hintText: "Agenda",
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
                    // Description TextFormField
                    TextFormField(
                      maxLines: 2,
                      onChanged: (text) {
                        dispatch(context,
                            UpdateLiveClassDescription(description: text));
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
                                      RemoveLiveClassFile(filename: file));
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
                      ),
                      child: Text("Upload"),
                    ),
                  ],
                ),
              ),
            ));
  }

  static getScreen() {
    return getBaseScreen<ScheduleLiveclassAppState, ScheduleLiveClass>(
        scheduleLiveclassStateReducer,
        const ScheduleLiveclassAppState(),
        const ScheduleLiveClass());
  }

  static dispatch(BuildContext context, dynamic action) {
    baseDispatch<ScheduleLiveclassAppState>(context, action);
  }
}
