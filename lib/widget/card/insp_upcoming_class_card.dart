import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/main.dart';
import 'package:inspflutterfrontend/pages/common/livestream/preview/liveclass_preview.dart';
import 'package:inspflutterfrontend/pages/common/recordingplayer/recording_player_screen.dart';
import 'package:inspflutterfrontend/utils/file_box_component.dart';
import 'package:inspflutterfrontend/utils/userDetail/getUserDetail.dart';
import 'package:inspflutterfrontend/widget/card/model/upcoming_lecture_card_model.dart';
import 'package:inspflutterfrontend/apiservices/models/mycourses/all_lectures_for_course_response_model.dart';
import 'package:inspflutterfrontend/utils/capitalize.dart';
import 'package:inspflutterfrontend/utils/timeconvert.dart';
import 'package:inspflutterfrontend/widget/popups/scheduleLiveclass/schedule_liveclass.dart';
import '../button/join_class.dart';

class ScheduleClassBox extends StatefulWidget {
  const ScheduleClassBox(
      {Key? key,
      required this.type,
      required this.upcomingWidgetAppState,
      required this.getUpcomingClass})
      : super(key: key);

  final String type;
  final UpcomingLectureCardModel upcomingWidgetAppState;
  final Function() getUpcomingClass;

  @override
  State<StatefulWidget> createState() => ScheduleClassBoxWidgetState();
}

class ScheduleClassBoxWidgetState extends State<ScheduleClassBox> {
  late List<AllLecturesForCourseResponseModelData> upcomingData;

  @override
  void initState() {
    super.initState();
  }

  List<AllLecturesForCourseResponseModelData> _getUpcomingData(String label) {
    switch (label) {
      case 'Ongoing':
        return widget.upcomingWidgetAppState.ongoing;
      case 'Today':
        return widget.upcomingWidgetAppState.today;
      case 'Week':
        return widget.upcomingWidgetAppState.week;
      default:
        return widget.upcomingWidgetAppState.completed;
    }
  }

  @override
  Widget build(BuildContext context) {
    upcomingData = _getUpcomingData(widget.type);

    const Map<String, String> classStatus = {
      'SCHEDULED': 'SCHEDULED',
      'ONGOING': 'ONGOING',
      'NOT_STARTED': 'NOT_STARTED',
      'FINISHED': 'FINISHED',
      'NOT_CONDUCTED': 'NOT_CONDUCTED',
    };

    return SizedBox(
      child: upcomingData.isNotEmpty
          ? ListView.builder(
              itemCount: upcomingData.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final data = upcomingData[index];
                final scheduledStartTime = convertTime(data.scheduledStartTime);
                final scheduledEndTime = convertTime(data.scheduledEndTime);
                final scheduledDate = formatDate(data.scheduledDate);
                final topicName = data.liveClassRoomDetail.topicName.isEmpty
                    ? "General"
                    : capitalizeFirstLetter(data.liveClassRoomDetail.topicName);

                void navigateToPreviewScreen() {
                  if (data.classStatus == classStatus['FINISHED']) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainScaffold(
                            content: RecordingPlayerScreen.getScreen(
                          "live",
                          data.id.toString(),
                        )),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainScaffold(
                            content:
                                LiveClassPreviewScreen(roomId: data.roomId)),
                      ),
                    );
                  }
                }

                return FutureBuilder<bool>(
                  future: isTeacherLogin(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Center(child: Text('Error loading data'));
                    } else {
                      bool isTeacher = snapshot.data ?? false;
                      return Column(
                        children: [
                          Card(
                            key: UniqueKey(),
                            color: Colors.white,
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _buildRow(
                                        context,
                                        topicName,
                                        '$scheduledStartTime - $scheduledEndTime',
                                      ),
                                      const SizedBox(height: 2),
                                      _buildSecondRow(
                                        context,
                                        data.mentorName,
                                        scheduledDate,
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        data.classLevel,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10,
                                          color:
                                              Color.fromRGBO(44, 51, 41, 0.47),
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      _buildFileBox(
                                          data.liveClassRoomFiles, isTeacher),
                                      const SizedBox(height: 16),
                                      _buildDescription(
                                        'Description',
                                        data.liveClassRoomDetail.description,
                                      ),
                                      const SizedBox(height: 16),
                                      if (widget.type == "Ongoing" ||
                                          widget.type == "Completed" ||
                                          isTeacher)
                                        JoinClassBtn(
                                          status: data.classStatus,
                                          isTeacher: isTeacher,
                                          onPressedViewDetails:
                                              navigateToPreviewScreen,
                                        ),
                                    ],
                                  ),
                                ),
                                if (isTeacher &&
                                    widget.type != 'Ongoing' &&
                                    widget.type != 'Completed')
                                  Positioned(
                                    right: 0,
                                    top: 0,
                                    child: IconButton(
                                      icon: const Icon(Icons.edit,
                                          color: Colors.black),
                                      iconSize: 16.0,
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return ScheduleLiveClass.getScreen(
                                              data.id,
                                              true,
                                              data.subjectName,
                                              data.scheduledDate,
                                              data.scheduledStartTime,
                                              data.scheduledEndTime,
                                              data.liveClassRoomDetail
                                                  .chapterName,
                                              data.liveClassRoomDetail
                                                  .topicName,
                                              data.classLevel,
                                              data.classType,
                                              data.liveClassRoomDetail.lectureNo
                                                  .toString(),
                                              data.liveClassRoomDetail.agenda,
                                              data.liveClassRoomDetail
                                                  .description,
                                              data.muteAllStudents,
                                              data.liveClassRoomFiles,
                                              widget.getUpcomingClass,
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                  },
                );
              },
            )
          : const Column(children: [
              Center(
                  child: Text(
                'No items',
                style: TextStyle(color: Color.fromRGBO(44, 51, 41, 0.47)),
              )),
              SizedBox(height: 20),
            ]),
    );
  }

  Row _buildRow(BuildContext context, String leftText, String rightText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            flex: 5,
            child: Tooltip(
              message: leftText,
              child: Text(
                leftText,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xFF2C3329),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )),
        const SizedBox(width: 5),
        Text(
          rightText,
          style: const TextStyle(
            fontSize: 10,
            color: Color.fromRGBO(44, 51, 41, 0.47),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Row _buildSecondRow(BuildContext context, String leftText, String rightText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leftText,
          style: const TextStyle(
            fontSize: 10,
            color: Color.fromRGBO(44, 51, 41, 0.47),
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          rightText,
          style: const TextStyle(
            fontSize: 10,
            color: Color.fromRGBO(44, 51, 41, 0.47),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildFileBox(List<LiveClassRoomFile> files, bool isTeacher) {
    return files.isNotEmpty
        ? FileBoxComponent(
            data: files,
            type: "live",
            scrollDirection: "vertical",
            maxHeight: files.length * 50 > 50 ? 60 : files.length * 50,
            isTeacher: isTeacher,
          )
        : const Text(
            'No Files',
            style: TextStyle(fontSize: 12),
          );
  }

  Widget _buildDescription(String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          description,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 12,
            color: Color.fromRGBO(44, 51, 41, 0.47),
          ),
        ),
      ],
    );
  }
}
