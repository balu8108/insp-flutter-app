import 'package:flutter/material.dart';
import 'package:insp/apiservices/models/recording/view_recording_response_model.dart';
import 'package:insp/utils/file_box_component.dart';
import 'package:insp/utils/userDetail/getUserDetail.dart';
import 'package:insp/widget/heading/insp_heading.dart';
import 'package:insp/widget/card/lecture_recording_card.dart';
import 'package:insp/widget/popups/uploadClassFile/upload_class_file.dart';

class RecordingDetailWidget extends StatelessWidget {
  final RecordVideoResponseModelData recordingPlayerDetail;
  final Function(BuildContext, String) onViewDetailsClicked;
  final Function() onUpdate;

  const RecordingDetailWidget(
      {super.key,
      required this.recordingPlayerDetail,
      required this.onViewDetailsClicked,
      required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    bool isTeacher = isTeacherLogin(context);

    return Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromRGBO(232, 242, 249, 1),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(flex: 9, child: INSPHeading('Live Recorded Class')),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            recordingPlayerDetail.liveClassRoomDetail.topicName,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color(0xFF2C3329),
              height: 1.25,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            recordingPlayerDetail.mentorName,
            style: const TextStyle(
              fontSize: 12,
              color: Color.fromRGBO(44, 51, 41, 0.47),
              height: 1.75,
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
            recordingPlayerDetail.liveClassRoomDetail.description,
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
          recordingPlayerDetail.liveClassRoomDetail.agenda
                  .split("\r\n")
                  .isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: recordingPlayerDetail.liveClassRoomDetail.agenda
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
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                agenda,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color.fromRGBO(44, 51, 41, 0.47),
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
          const SizedBox(height: 40),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text(
              'Files',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color(0xFF2C3329),
                height: 1.25,
              ),
            ),
            if (isTeacher)
              IconButton(
                icon: const Icon(Icons.file_upload_outlined),
                iconSize: 24.0,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return UploadClassFile.getScreen(
                            recordingPlayerDetail.id.toString(),
                            "live",
                            onUpdate);
                      });
                },
              ),
          ]),
          const SizedBox(height: 2),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            child: recordingPlayerDetail.liveClassRoomFiles.isNotEmpty
                ? FileBoxComponent(
                    data: recordingPlayerDetail.liveClassRoomFiles,
                    type: "live",
                    scrollDirection: "vertical",
                    isTeacher: isTeacher,
                    isRecordingScreen: true)
                : const Text(
                    'No Files',
                    style: TextStyle(fontSize: 12),
                  ),
          ),
          const SizedBox(height: 40),
          const Text(
            'Recordings',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF2C3329),
              height: 1.25,
            ),
          ),
          const SizedBox(height: 2),
          LectureRecordingCardWidget(
            liveClassRoomRecordings: recordingPlayerDetail
                    .liveClassRoomRecordings.isNotEmpty
                ? recordingPlayerDetail.liveClassRoomRecordings.sublist(1)
                : [], // later we have to add condition. right now we now only 1 recording will we there
            classId: recordingPlayerDetail.id.toString(),
          )
        ]));
  }
}
