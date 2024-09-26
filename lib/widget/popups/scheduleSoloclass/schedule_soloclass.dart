import 'package:flutter/material.dart';
import 'package:insp/apiservices/models/mycourses/all_lectures_for_course_response_model.dart';
import 'package:insp/main.dart';
import 'package:insp/pages/teacher/soloclassrecording/screen/soloclassroomscreen.dart';
import 'package:insp/utils/extensions.dart';
import 'package:insp/utils/extractFileNameFromS3URL.dart';
import 'package:insp/widget/inputField/picked_file.dart';
import 'package:insp/widget/inputField/textfield_withoutsuffix.dart';
import 'package:insp/widget/popups/scheduleSoloclass/schedule_soloclass_redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/base/base.dart';
import 'package:insp/data/hardcoded/topic_list.dart';
import 'package:insp/widget/inputField/dropdown.dart';

class ScheduleSoloClass extends StatelessWidget {
  const ScheduleSoloClass({super.key});

  @override
  Widget build(BuildContext context) {
    bool isWebOrLandScape = context.isWebOrLandScape();
    void createSoloClass() {
      dispatch(context, handleCreateSoloClass(context));
      pushWithoutAnimation(context, const Soloclassroomscreen());
    }

    dispatch(context, getLectureNumberAPI(context));
    dispatch(context, showAllTopics(context));

    void uploadFile() {
      dispatch(context, pickFilesforSoloclass(context));
    }

    void defaultLoaderFunction() {}

    return StoreConnector<ScheduleSoloclassAppState, ScheduleSoloclassAppState>(
        converter: (store) => store.state,
        builder: (context, ScheduleSoloclassAppState state) => AlertDialog(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 26, horizontal: 28),
                insetPadding: isWebOrLandScape ? null : EdgeInsets.zero,
                title: Row(
                  children: [
                    Text(state.isEditScreen ? "Update record" : "Solo record",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        )),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
                content: SizedBox(
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
                                UpdateSoloClassSelectedSubject(
                                    selectedSubject: newValue));
                          },
                          hintText: "Select Subject...",
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
                            value: state.agenda,
                            onChanged: (text) {
                              dispatch(
                                  context, UpdateSoloClassAgenda(agenda: text));
                            },
                            selectedValueError: state.agendaError),
                        const SizedBox(height: 16.0),
                        TextFieldWithoutSuffix(
                            hintText: "Description",
                            value: state.description,
                            onChanged: (text) {
                              dispatch(
                                  context,
                                  UpdateSoloClassDescription(
                                      description: text));
                            },
                            selectedValueError: state.descriptionError),
                        const SizedBox(height: 16.0),
                        // File Upload Row
                        PickedFile(
                            uploadFile: uploadFile,
                            removeFile: (file) {
                              dispatch(
                                  context, RemoveSoloClassFile(filename: file));
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
                                        RemovePreviousSoloClassFile(
                                            id: file.id)),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                actions: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: isWebOrLandScape
                              ? MediaQuery.of(context).size.width * 0.20
                              : MediaQuery.of(context).size.width * 0.50,
                          child: ElevatedButton(
                              onPressed: state.isClassLoading
                                  ? defaultLoaderFunction
                                  : createSoloClass,
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor:
                                    const Color.fromRGBO(60, 141, 188, 1),
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              child: state.isClassLoading
                                  ? const SizedBox(
                                      width: 18,
                                      height: 18,
                                      child: Center(
                                          child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2,
                                      )))
                                  : Text(
                                      state.isEditScreen ? "Update" : "Start")),
                        ),
                      ])
                ]));
  }

  static getScreen(
    int soloClassRoomId,
    bool isEditScreen,
    String selectedSubject,
    String selectedTopic,
    String lectureNo,
    String agenda,
    String description,
    List<LiveClassRoomFile> previousFiles,
  ) {
    return getBaseScreen<ScheduleSoloclassAppState, ScheduleSoloClass>(
        scheduleSoloclassStateReducer,
        ScheduleSoloclassAppState(
            soloClassRoomId: soloClassRoomId,
            isEditScreen: isEditScreen,
            selectedSubject: selectedSubject,
            selectedTopic: selectedTopic,
            lectureNo: lectureNo,
            agenda: agenda,
            description: description,
            previousFiles: previousFiles),
        const ScheduleSoloClass());
  }

  static dispatch(BuildContext context, dynamic action) {
    baseDispatch<ScheduleSoloclassAppState>(context, action);
  }
}
