import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/widget/inputField/picked_file.dart';
import 'package:inspflutterfrontend/widget/inputField/textfield_suffix.dart';
import 'package:inspflutterfrontend/widget/inputField/textfield_withoutsuffix.dart';
import 'package:intl/intl.dart';
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
    TimeOfDay selectedStartTime = TimeOfDay.now();
    TimeOfDay selectedEndTime = TimeOfDay.now();

    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2020, 8),
          lastDate: DateTime(2101));
      if (picked != null && picked != selectedDate) {
        final String formattedDate = DateFormat('dd/MM/yyyy').format(picked);
        dispatch(
            context, UpdateLiveClassSelectedDate(selectedDate: formattedDate));
      }
    }

    Future<void> _selectStartTime(BuildContext context) async {
      // Select the start time
      final TimeOfDay? pickedStartTime = await showTimePicker(
        context: context,
        initialTime: selectedStartTime,
      );
      if (pickedStartTime != null) {
        final String formattedTime = pickedStartTime.format(context);
        dispatch(context,
            UpdateLiveClassSelectedStartTime(selectedStartTime: formattedTime));
      }
    }

    Future<void> _selectEndTime(BuildContext context) async {
      // Select the start time
      final TimeOfDay? pickedEndTime = await showTimePicker(
        context: context,
        initialTime: selectedEndTime,
      );
      if (pickedEndTime != null) {
        final String formattedTime = pickedEndTime.format(context);
        dispatch(context,
            UpdateLiveClassSelectedEndTime(selectedEndTime: formattedTime));
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
                  height: 700,
                  width: 500, // Set your desired width here
                  child: SingleChildScrollView(
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
                          selectedValueError: state.selectedSubjectError,
                          selectedValue: state.selectedSubject!.isEmpty
                              ? null
                              : state.selectedSubject,
                          onChanged: (String? newValue) {
                            dispatch(
                                context,
                                UpdateLiveClassSelectedSubject(
                                    selectedSubject: newValue));

                            dispatch(context, getLectureNumber(context));
                          },
                          hintText: "Select Subject...",
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          children: [
                            Expanded(
                                flex: 9,
                                child: TextFieldSuffix(
                                    selectedValue: state.selectedDate!,
                                    selectedValueError:
                                        state.selectedDateError!,
                                    hintText: 'dd/mm/yyyy',
                                    onChanged: () async {
                                      await _selectDate(context);
                                    },
                                    icon: Icons.calendar_month)),
                            const Spacer(),
                            Expanded(
                                flex: 9,
                                child: TextFieldSuffix(
                                    selectedValue: state.selectedStartTime!,
                                    selectedValueError:
                                        state.selectedStartTimeError!,
                                    hintText: '--:--',
                                    onChanged: () async {
                                      await _selectStartTime(context);
                                    },
                                    icon: Icons.access_time_rounded)),
                            const Spacer(),
                            Expanded(
                                flex: 9,
                                child: TextFieldSuffix(
                                    selectedValue: state.selectedEndTime!,
                                    selectedValueError:
                                        state.selectedEndTimeError!,
                                    hintText: '--:--',
                                    onChanged: () async {
                                      await _selectEndTime(context);
                                    },
                                    icon: Icons.access_time_rounded)),
                          ],
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
                          selectedValueError: state.selectedClassLevelError,
                          selectedValue: state.selectedClassLevel!.isEmpty
                              ? null
                              : state.selectedClassLevel,
                          onChanged: state.selectedSubject == "PHYSICS"
                              ? (String? newValue) {
                                  dispatch(
                                      context,
                                      UpdateLiveClassSelectedClassLevel(
                                          selectedClassLevel: newValue));
                                  dispatch(context, getLectureNumber(context));
                                }
                              : null,
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
                          selectedValueError: state.selectedChapterError,
                          selectedValue: state.selectedChapter!.isEmpty
                              ? null
                              : state.selectedChapter,
                          onChanged: state.selectedSubject == "PHYSICS"
                              ? (String? newValue) {
                                  dispatch(
                                      context,
                                      showTopicsforLiveClassByChapter(
                                          context, newValue));
                                }
                              : null,
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
                          selectedValueError: state.selectedTopicError,
                          selectedValue: state.selectedTopic!.isEmpty
                              ? null
                              : state.selectedTopic,
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
                        // classType Dropdown
                        Dropdown(
                          items: classType.map((ChapterTopicModel item) {
                            return DropdownMenuItem<String>(
                              value: item.label,
                              child: Text(item.label),
                            );
                          }).toList(),
                          selectedValueError: state.selectedCourseTypeError,
                          selectedValue: state.selectedCourseType!.isEmpty
                              ? null
                              : state.selectedCourseType,
                          onChanged: state.selectedSubject == "PHYSICS"
                              ? (String? newValue) {
                                  dispatch(
                                      context,
                                      UpdateLiveClassSelectedCourseType(
                                          selectedCourseType: newValue));
                                  dispatch(context, getLectureNumber(context));
                                }
                              : null,
                          hintText: "Select course type...",
                        ),
                        const SizedBox(height: 16.0),
                        TextField(
                          enabled: false,
                          controller: TextEditingController()
                            ..text = state.lectureNo!,
                          decoration: const InputDecoration(
                            hintText: 'Lecture',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: Color(0x613A3541),
                            ),
                            contentPadding: EdgeInsets.all(14.0),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(58, 53, 65, 0.23),
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2.0,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(6.0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        TextFieldWithoutSuffix(
                            hintText: "Agenda",
                            onChanged: (text) {
                              dispatch(
                                  context, UpdateLiveClassAgenda(agenda: text));
                            },
                            selectedValueError: state.agendaError),
                        const SizedBox(height: 16.0),
                        TextFieldWithoutSuffix(
                            hintText: "Description",
                            onChanged: (text) {
                              dispatch(
                                  context,
                                  UpdateLiveClassDescription(
                                      description: text));
                            },
                            selectedValueError: state.descriptionError),
                        const SizedBox(height: 16.0),
                        // File Upload Row
                        PickedFile(
                            uploadFile: uploadFile,
                            removeFile: (file) {
                              dispatch(
                                  context, RemoveLiveClassFile(filename: file));
                            },
                            pickedFilesName: state.pickedFilesName),
                        const SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              activeColor: Colors.blue,
                              value: state.isStudentMuted,
                              onChanged: (bool? value) {
                                dispatch(
                                    context,
                                    UpdateLiveClassIsStudentMuted(
                                        isStudentMuted: value));
                              },
                            ),
                            const Text('Mute all the participants',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Color(0xFF718096),
                                )),
                          ],
                        ),
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
                            child: Text("Schedule Class"),
                          ),
                        ),
                      ])
                ]));
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
