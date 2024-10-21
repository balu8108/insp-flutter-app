import 'package:flutter/material.dart';
import 'package:insp/apiservices/models/recording/view_solo_recording_response_model.dart';
import 'package:insp/utils/file_box_component.dart';
import 'package:insp/utils/userDetail/getUserDetail.dart';
import 'package:insp/widget/card/solo_recording_card.dart';
import 'package:insp/widget/heading/insp_heading.dart';
import 'package:insp/widget/popups/uploadClassFile/upload_class_file.dart';

class SoloRecordingDetailWidget extends StatelessWidget {
  final RecordSoloVideoResponseModelData recordingSoloPlayerDetail;
  final Function(BuildContext, String) onViewDetailsClicked;
  final Function() onUpdate;

  const SoloRecordingDetailWidget(
      {super.key,
      required this.recordingSoloPlayerDetail,
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
              Expanded(flex: 9, child: INSPHeading('Solo Recorded Class')),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            recordingSoloPlayerDetail.topic,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color(0xFF2C3329),
              height: 1.25,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            recordingSoloPlayerDetail.mentorName,
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
            recordingSoloPlayerDetail.description,
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
          recordingSoloPlayerDetail.agenda.split("\r\n").isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: recordingSoloPlayerDetail.agenda
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
                            recordingSoloPlayerDetail.id.toString(),
                            "solo",
                            onUpdate);
                      });
                },
              ),
          ]),
          const SizedBox(height: 2),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            child: recordingSoloPlayerDetail.soloClassRoomFiles.isNotEmpty
                ? FileBoxComponent(
                    data: recordingSoloPlayerDetail.soloClassRoomFiles,
                    type: "solo",
                    scrollDirection: "vertical",
                    isTeacher: isTeacher)
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
          SoloRecordingCardWidget(
            soloClassRoomRecordings: recordingSoloPlayerDetail
                    .soloClassRoomRecordings.isNotEmpty
                ? recordingSoloPlayerDetail.soloClassRoomRecordings.sublist(1)
                : [], // later we have to add condition. right now we now only 1 recording will we there
          )
        ]));
  }
}
