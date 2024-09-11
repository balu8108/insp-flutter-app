import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/utils/class_constants.dart';
import 'package:inspflutterfrontend/utils/file_box_component.dart';
import 'package:inspflutterfrontend/utils/userDetail/getUserDetail.dart';
import 'package:inspflutterfrontend/widget/heading/insp_heading.dart';
import 'package:inspflutterfrontend/widget/card/lecture_assignment_card.dart';
import 'package:inspflutterfrontend/widget/card/lecture_leaderboard_card.dart';
import 'package:inspflutterfrontend/widget/card/lecture_recording_card.dart';
import 'package:inspflutterfrontend/widget/card/model/lecture_assignment_card_model.dart';
import 'package:inspflutterfrontend/apiservices/models/upcomingclasses/lecture_detail_by_roomid_response_model.dart';

class LectureDetailWidget extends StatefulWidget {
  const LectureDetailWidget(
      {super.key,
      required this.lectureData,
      required this.assignments,
      required this.question});

  final AllLecturesData lectureData;
  final int question;
  final List<LectureAssignmentCardModel> assignments;

  @override
  State<LectureDetailWidget> createState() {
    return LectureDetailWidgetState();
  }
}

class LectureDetailWidgetState extends State<LectureDetailWidget> {
  @override
  Widget build(BuildContext context) {
    final LecturesDetailResponseModelData lec =
        widget.lectureData.liveClassRoom;
    return Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromRGBO(232, 242, 249, 1),
        ),
        child: FutureBuilder<bool>(
            future: isTeacherLogin(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text('Error loading data'));
              } else {
                bool isTeacher = snapshot.data ?? false;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            flex: 9,
                            child: INSPHeading(
                                'Details : ( ${lec.liveClassRoomDetail.topicName} ) :(${ClassLevel.getValueFromName(lec.classLevel)})')),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Lecture ${lec.liveClassRoomDetail.lectureNo}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Color(0xFF2C3329),
                                  height: 1.25,
                                ),
                              ),
                              const SizedBox(height: 40),
                              const Text(
                                'Description',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Color(0xFF2C3329),
                                  height: 1.25,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                lec.liveClassRoomDetail.description,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color.fromRGBO(44, 51, 41, 0.47),
                                  height: 1.75,
                                ),
                              ),
                              const SizedBox(height: 40),
                              const Text(
                                'Agenda',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF2C3329),
                                  height: 1.25,
                                ),
                              ),
                              const SizedBox(height: 2),
                              lec.liveClassRoomDetail.agenda
                                      .split("\r\n")
                                      .isNotEmpty
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: lec.liveClassRoomDetail.agenda
                                          .split("\r\n")
                                          .take(4)
                                          .map<Widget>(
                                            (agenda) => Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 4),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 7,
                                                    height: 7,
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey[400],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 6),
                                                  Text(
                                                    agenda,
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Color.fromRGBO(
                                                          44, 51, 41, 0.47),
                                                      height: 1.75,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    )
                                  : const Text(
                                      'No Data',
                                      style: TextStyle(
                                        color: Color.fromRGBO(44, 51, 41, 0.47),
                                        fontSize: 12,
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Leader Board',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Color(0xFF2C3329),
                                  height: 1.25,
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 4, // 60%
                                    child: Image.asset(
                                        'assets/images/leaderboard.png'),
                                  ),
                                  Expanded(
                                      flex: 6, // 60%
                                      child: LectureLeaderboardCard(
                                          leaderboardDetails: lec.leaderBoards,
                                          questionNo: widget
                                              .lectureData.questionLogCount))
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Recordings',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xFF2C3329),
                            height: 1.25,
                          ),
                        ),
                        const SizedBox(height: 10),
                        LectureRecordingCardWidget(
                            liveClassRoomRecordings:
                                lec.liveClassRoomRecordings,
                            classId: lec.id.toString(),
                            topicName: lec.liveClassRoomDetail.topicName,
                            mentorName: lec.mentorName,
                            description: lec.liveClassRoomDetail.description,
                            files: lec.liveClassRoomFiles,
                            agenda: lec.liveClassRoomDetail.agenda)
                      ],
                    ),
                    const SizedBox(height: 40),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Files/Notes',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF2C3329),
                            height: 1.25,
                          ),
                        ),
                        const SizedBox(height: 10),
                        FileBoxComponent(
                          data: lec.liveClassRoomFiles,
                          type: "live",
                          scrollDirection: "horizontal",
                          maxHeight: 60,
                          isTeacher: isTeacher,
                        )
                      ],
                    ),
                    const SizedBox(height: 40),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Assignments',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF2C3329),
                            height: 1.25,
                          ),
                        ),
                        const SizedBox(height: 10),
                        LectureAssignmentCard(
                          assignmentDetails: widget.assignments,
                        )
                      ],
                    )
                  ],
                );
              }
            }));
  }
}
