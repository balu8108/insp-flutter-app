import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/utils/file_box_component.dart';
import 'package:inspflutterfrontend/widget/card/model/upcoming_lecture_card_model.dart';
import 'package:inspflutterfrontend/apiservices/models/mycourses/all_lectures_for_course_response_model.dart';
import 'package:inspflutterfrontend/utils/capitalize.dart';
import 'package:inspflutterfrontend/utils/timeconvert.dart';
import '../button/join_class.dart';

class ScheduleClassBox extends StatefulWidget {
  const ScheduleClassBox({
    Key? key,
    required this.type,
    required this.upcomingWidgetAppState,
  }) : super(key: key);

  final String type;
  final UpcomingLectureCardModel upcomingWidgetAppState;

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
    return SizedBox(
      height: upcomingData.isNotEmpty ? upcomingData.length * 350 : 100,
      child: upcomingData.isNotEmpty
          ? ListView.separated(
              itemCount: upcomingData.length,
              itemBuilder: (BuildContext context, int index) {
                final data = upcomingData[index];
                final scheduledStartTime = convertTime(data.scheduledStartTime);
                final scheduledEndTime = convertTime(data.scheduledEndTime);
                final scheduledDate = formatDate(data.scheduledDate);
                final topicName = data.liveClassRoomDetail.topicName.isEmpty
                    ? "General"
                    : capitalizeFirstLetter(data.liveClassRoomDetail.topicName);

                return Column(
                  children: [
                    Card(
                      key: UniqueKey(),
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                color: Color.fromRGBO(44, 51, 41, 0.47),
                              ),
                            ),
                            const SizedBox(height: 16),
                            _buildFileBox(data.liveClassRoomFiles),
                            const SizedBox(height: 16),
                            _buildDescription(
                              'Description',
                              data.liveClassRoomDetail.description,
                            ),
                            const SizedBox(height: 16),
                            JoinClassBtn(status: data.classStatus),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(width: 17),
            )
          : const Center(child: Text('No items')),
    );
  }

  Row _buildRow(BuildContext context, String leftText, String rightText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Tooltip(
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

  Widget _buildFileBox(List<LiveClassRoomFile> files) {
    return files.isNotEmpty
        ? FileBoxComponent(
            data: files,
            type: "live",
            scrollDirection: "vertical",
            maxHeight: files.isNotEmpty
                ? files.length * 50 > 100
                    ? 100
                    : files.length * 50
                : 50,
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
