import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/common/file_box_component.dart';
import 'package:inspflutterfrontend/common/insp_heading.dart';
import 'package:inspflutterfrontend/common/lecture_recording_card.dart';
import 'package:inspflutterfrontend/common/model/recording_player_card_model.dart';

class RecordingDetailWidget extends StatelessWidget {
  final RecordingPlayerCard recordingPlayerDetail;
  final Function(BuildContext, RecordingPlayerCard) onViewDetailsClicked;

  RecordingDetailWidget({
    required this.recordingPlayerDetail,
    required this.onViewDetailsClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromRGBO(232, 242, 249, 1),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          INSPHeading('Recorded Class'),
          const SizedBox(
            height: 40,
          ),
          Text(
            recordingPlayerDetail.topicName,
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
            recordingPlayerDetail.description,
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
          recordingPlayerDetail.agenda.split("\r\n").isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: recordingPlayerDetail.agenda
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
          const Text(
            'Files',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF2C3329),
              height: 1.25,
            ),
          ),
          const SizedBox(height: 2),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            child: recordingPlayerDetail.liveClassRoomFiles.isNotEmpty
                ? FileBoxComponent(
                    data: recordingPlayerDetail.liveClassRoomFiles,
                    type: "live",
                    scrollDirection: "vertical",
                    maxHeight: 140)
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
              liveClassRoomRecordings:
                  recordingPlayerDetail.liveClassRoomRecordings,
              topicName: recordingPlayerDetail.agenda,
              mentorName: recordingPlayerDetail.mentorName,
              description: recordingPlayerDetail.description,
              files: recordingPlayerDetail.liveClassRoomFiles,
              agenda: recordingPlayerDetail.agenda)
        ]));
  }
}
