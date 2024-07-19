import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/common/file_box_component.dart';
import 'package:inspflutterfrontend/common/insp_heading.dart';
import 'package:inspflutterfrontend/common/lecture_recording_card.dart';
import 'package:inspflutterfrontend/data/remote/models/upcomingclasses/lecture_detail_by_roomid_response_model.dart';
import 'package:inspflutterfrontend/lecturedetail/lecture_detail_widget_state.dart';

class LectureDetailWidget extends StatefulWidget {
  const LectureDetailWidget(
      {super.key, required this.lectureData, required this.question});

  final AllLecturesData lectureData;
  final int question;

  @override
  State<LectureDetailWidget> createState() {
    return LectureDetailWidgetState();
  }
}

class LectureDetailWidgetState extends State<LectureDetailWidget> {
  LectureDetailWidgetAppState lectureDetailWidgetAppState =
      const LectureDetailWidgetAppState();

  void updateState(LectureDetailWidgetAppState lectureDetailWidgetAppState) {
    setState(() {
      this.lectureDetailWidgetAppState = lectureDetailWidgetAppState;
    });
  }

  @override
  void didUpdateWidget(LectureDetailWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Handle any updates when the widget configuration changes
    if (oldWidget.lectureData != widget.lectureData) {
      print("Lecture Datggd: ${widget.lectureData.questionLogCount}");
    }
  }

  @override
  void initState() {
    super.initState();
  }

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
      child: Column(
        children: [
          INSPHeading(
              'Details : ( ${lec.liveClassRoomDetail.topicName} ) :(${lec.classLevel})'),
          const SizedBox(
            height: 40,
          ),
          Row(
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
                        color: Color(0xFF2C3329),
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
                                            color: Color(0xFF2C3329),
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
                              color: Color(0xFF2C332978),
                              fontSize: 12,
                            ),
                          ),
                    const SizedBox(height: 40),
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
                                lec.liveClassRoomRecordings)
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
                          scrollDirection: "horizantal",
                          maxHeight: 60,
                        )
                      ],
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      'Assignments',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF2C3329),
                        height: 1.25,
                      ),
                    ),
                    const SizedBox(height: 2),
                  ],
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Leader Board',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color(0xFF2C3329),
                        height: 1.25,
                      ),
                    ),
                    // LectureLeaderBoard(
                    //   lectureDetails: lectureDetails,
                    //   questionLog: questionLog,
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
