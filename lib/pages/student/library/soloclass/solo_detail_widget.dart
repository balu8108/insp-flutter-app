import 'package:flutter/material.dart';
import 'package:insp/apiservices/models/soloclasses/soloclass_detail_response_model.dart';
import 'package:insp/utils/extensions.dart';
import 'package:insp/utils/file_box_component.dart';
import 'package:insp/utils/userDetail/getUserDetail.dart';
import 'package:insp/widget/card/solo_recording_card.dart';
import 'package:insp/widget/heading/insp_heading.dart';

class SoloDetailWidget extends StatefulWidget {
  const SoloDetailWidget(
      {super.key, required this.lectureData, required this.onUpdate});

  final SoloClassDetail lectureData;
  final Function() onUpdate;

  @override
  State<SoloDetailWidget> createState() {
    return SoloDetailWidgetState();
  }
}

class SoloDetailWidgetState extends State<SoloDetailWidget> {
  @override
  Widget build(BuildContext context) {
    bool isTeacher = isTeacherLogin(context);
    bool isWebOrLandScape = context.isWebOrLandScape();
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
                        'Details : ( ${widget.lectureData.soloClassroomDetails.topic} )')),
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
                              widget
                                  .lectureData.soloClassroomDetails.description,
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
                            widget.lectureData.soloClassroomDetails.agenda
                                    .split("\r\n")
                                    .isNotEmpty
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: widget
                                        .lectureData.soloClassroomDetails.agenda
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
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                        widget.lectureData.soloClassroomDetails.description,
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
                      widget.lectureData.soloClassroomDetails.agenda
                              .split("\r\n")
                              .isNotEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: widget
                                  .lectureData.soloClassroomDetails.agenda
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
                SoloRecordingCardWidget(
                    soloClassRoomRecordings:
                        widget.lectureData.soloClassRoomRecordings)
              ],
            ),
            const SizedBox(height: 40),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Text(
                      'Files/Notes',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF2C3329),
                        height: 1.25,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
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
                  data: widget.lectureData.soloClassRoomFile,
                  type: "solo",
                  scrollDirection: "horizontal",
                  isTeacher: isTeacher,
                )
              ],
            ),
          ],
        ));
  }
}
