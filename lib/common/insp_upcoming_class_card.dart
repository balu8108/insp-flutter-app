import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/common/extensions.dart';
import 'package:inspflutterfrontend/common/file_box_component.dart';
import 'package:inspflutterfrontend/data/remote/models/mycourses/all_lectures_for_course_response_model.dart';
import 'package:inspflutterfrontend/utils/capitalize.dart';
import 'package:inspflutterfrontend/utils/timeconvert.dart';
import 'package:intl/intl.dart';

import 'button/join_class.dart';

class ScheduleClassBox extends StatefulWidget {
  const ScheduleClassBox(
      {super.key, required this.type, required this.upcomingData});

  final List<AllLecturesForCourseResponseModelData> upcomingData;
  final String type;

  @override
  State<StatefulWidget> createState() {
    return ScheduleClassBoxWidgetState(type, upcomingData);
  }
}

class ScheduleClassBoxWidgetState extends State<ScheduleClassBox> {
  ScheduleClassBoxWidgetState(this.type, this.upcomingData);

  final List<AllLecturesForCourseResponseModelData> upcomingData;
  final String type;

  String descriptionText = 'Description';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      child: upcomingData.isNotEmpty
          ? Scrollbar(
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: upcomingData.length,
                itemBuilder: (BuildContext context, int index) {
                  String scheduledStartTime =
                      convertTime(upcomingData[index].scheduledStartTime);
                  String scheduledEndTime =
                      convertTime(upcomingData[index].scheduledEndTime);
                  String scheduledDate =
                      formatDate(upcomingData[index].scheduledDate);
                  return Column(
                    children: [
                      Card(
                          key: UniqueKey(),
                          color: Colors.white,
                          child: Container(
                            width: context.isWebOrLandScape()
                                ? MediaQuery.of(context).size.width / 3
                                : MediaQuery.of(context).size.width * 0.6,
                            padding: const EdgeInsets.all(16),
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Tooltip(
                                          message: upcomingData[index]
                                .liveClassRoomDetail
                                .topicName == ""? "General": capitalizeFirstLetter(
                                              upcomingData[index]
                                                  .liveClassRoomDetail
                                                  .topicName),
                                          child: Text(
                                            upcomingData[index]
                                                .liveClassRoomDetail
                                                .topicName == ""? "General": capitalizeFirstLetter(
                                                upcomingData[index]
                                                    .liveClassRoomDetail
                                                    .topicName),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: Color(0xFF2C3329),
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Text(
                                          '$scheduledStartTime - $scheduledEndTime',
                                          style: const TextStyle(
                                            fontSize: 10,
                                            color: Color.fromRGBO(
                                                44, 51, 41, 0.47),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          upcomingData[index].mentorName,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10,
                                            color: Color.fromRGBO(
                                                44, 51, 41, 0.47),
                                          ),
                                        ),
                                        Text(
                                          scheduledDate,
                                          style: const TextStyle(
                                            fontSize: 10,
                                            color: Color.fromRGBO(
                                                44, 51, 41, 0.47),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      upcomingData[index].classLevel,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10,
                                        color: Color.fromRGBO(44, 51, 41, 0.47),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 16),
                                      child: upcomingData[index]
                                              .liveClassRoomFiles
                                              .isNotEmpty
                                          ? FileBoxComponent(
                                              data: upcomingData[index]
                                                  .liveClassRoomFiles,
                                              type: "live",
                                            )
                                          : const Text(
                                              'No Files',
                                              style: TextStyle(fontSize: 12),
                                            ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          descriptionText,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          upcomingData[index]
                                              .liveClassRoomDetail
                                              .description,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Color.fromRGBO(
                                                44, 51, 41, 0.47),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    JoinClassBtn(
                                      status: upcomingData[index].classStatus,
                                    ),
                                  ],
                                ),
                                // if (checkUserType(userProfile) == UserType.teacher && label != 1 && label != 4)
                                // Positioned(
                                //   top: 4,
                                //   right: 4,
                                //   child: IconButton(
                                //     icon: Icon(Icons.edit),
                                //     // onPressed: () {
                                //     //   onSchedulePopupOpen();
                                //     // },
                                //     tooltip: 'Edit',
                                //   ),
                                // ),
                              ],
                            ),
                          ))
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 17,
                  );
                },
              ),
            )
          : const Center(child: Text('No items')),
    );
  }
}
