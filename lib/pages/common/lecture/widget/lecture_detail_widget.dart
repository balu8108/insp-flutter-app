import 'package:flutter/material.dart';
import 'package:insp/utils/class_constants.dart';
import 'package:insp/utils/extensions.dart';
import 'package:insp/utils/file_box_component.dart';
import 'package:insp/utils/userDetail/getUserDetail.dart';
import 'package:insp/widget/heading/insp_heading.dart';
import 'package:insp/widget/card/lecture_assignment_card.dart';
import 'package:insp/widget/card/lecture_leaderboard_card.dart';
import 'package:insp/widget/card/lecture_recording_card.dart';
import 'package:insp/widget/card/model/lecture_assignment_card_model.dart';
import 'package:insp/apiservices/models/upcomingclasses/lecture_detail_by_roomid_response_model.dart';
import 'package:insp/widget/popups/uploadClassFile/upload_class_file.dart';

class LectureDetailWidget extends StatefulWidget {
  const LectureDetailWidget(
      {super.key,
      required this.lectureData,
      required this.assignments,
      required this.question,
      required this.onUpdate});

  final AllLecturesData lectureData;
  final int question;
  final List<LectureAssignmentCardModel> assignments;
  final Function() onUpdate;

  @override
  State<LectureDetailWidget> createState() {
    return LectureDetailWidgetState();
  }
}

class LectureDetailWidgetState extends State<LectureDetailWidget> {
  @override
  Widget build(BuildContext context) {
    bool isTeacher = isTeacherLogin(context);
    bool isWebOrLandScape = context.isWebOrLandScape();
    void dummy() {}
    final LecturesDetailResponseModelData lec =
        widget.lectureData.liveClassRoom;
    return Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromRGBO(232, 242, 249, 1),
        ),
        child: Column(
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
            isWebOrLandScape
                ? Row(
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
                  )
                : Column(
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
                      lec.liveClassRoomDetail.agenda.split("\r\n").isNotEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: lec.liveClassRoomDetail.agenda
                                  .split("\r\n")
                                  .take(4)
                                  .map<Widget>(
                                    (agenda) => Padding(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 7,
                                            height: 7,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[400],
                                              borderRadius:
                                                  BorderRadius.circular(100),
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
                      const SizedBox(height: 20),
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
                            child: Image.asset('assets/images/leaderboard.png'),
                          ),
                          Expanded(
                              flex: 6, // 60%
                              child: LectureLeaderboardCard(
                                  leaderboardDetails: lec.leaderBoards,
                                  questionNo:
                                      widget.lectureData.questionLogCount))
                        ],
                      )
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
                    liveClassRoomRecordings: lec.liveClassRoomRecordings,
                    classId: lec.id.toString())
              ],
            ),
            const SizedBox(height: 40),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Files/Notes',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF2C3329),
                        height: 1.25,
                      ),
                    ),
                    // const SizedBox(
                    //   width: 10,
                    // ),
                    // if (isTeacher)
                    //   IconButton(
                    //     icon: const Icon(Icons.file_upload_outlined),
                    //     iconSize: 24.0,
                    //     onPressed: () {
                    //       showDialog(
                    //           context: context,
                    //           builder: (BuildContext context) {
                    //             return UploadClassFile.getScreen(
                    //                 lec.id.toString(), "live", widget.onUpdate);
                    //           });
                    //     },
                    //   ),
                  ],
                ),
                const SizedBox(height: 10),
                FileBoxComponent(
                  data: lec.liveClassRoomFiles,
                  type: "live",
                  scrollDirection: "horizontal",
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
        ));
  }
}
