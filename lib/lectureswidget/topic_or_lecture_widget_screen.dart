import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/common/extensions.dart';
import 'package:inspflutterfrontend/common/insp_heading.dart';
import 'package:inspflutterfrontend/common/model/lecture_card_model.dart';
import 'package:inspflutterfrontend/lecturedetail/lecture_detail_screen.dart';

import '../common/insp_lecture_card.dart';
import '../common/search_box.dart';
import 'topic_or_lecture_widget_state.dart';

class TopicOrLectureWidget extends StatefulWidget {
  const TopicOrLectureWidget(
      {super.key, required this.heading, required this.data});

  final String heading;
  final List<LectureCardModel> data;

  @override
  State<StatefulWidget> createState() {
    return TopicOrLectureWidgetState(heading, data);
  }
}

class TopicOrLectureWidgetState extends State<TopicOrLectureWidget> {
  TopicOrLectureWidgetState(this.heading, this.data);

  final String heading;
  final List<LectureCardModel> data;
  LecturesWidgetAppState lecturesWidgetAppState = LecturesWidgetAppState();

  void onPressedMyCourse(
      BuildContext context, LectureCardModel lectureCardModel) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                LectureDetailScreen.getScreen(lectureCardModel)));
  }

  void updateState(LecturesWidgetAppState lecturesWidgetAppState) {
    setState(() {
      this.lecturesWidgetAppState = lecturesWidgetAppState;
    });
  }

  @override
  void initState() {
    super.initState();
    final allLectureData = data
        .map((lecture) => LectureCardModel(
            lecture.id.toString(),
            lecture.roomId,
            lecture.name,
            lecture.status,
            lecture.description,
            lecture.topicName,
            lecture.scheduledDate,
            lecture.classLevel))
        .toList();
    updateState(lecturesWidgetAppState.copyWith(
        filteredLectureForSelectedCourse: allLectureData));
  }

  @override
  Widget build(BuildContext context) {
    void filterWithQueryText(String query) {
      updateState(lecturesWidgetAppState.copyWith(query: query));
      final filteredTopics =
          lecturesWidgetAppState.allLectureForSelectedCourse.where((it) {
        return it.topicName.toLowerCase().contains(query.toLowerCase());
      }).toList();
      updateState(lecturesWidgetAppState.copyWith(
          filteredLectureForSelectedCourse: filteredTopics));
    }

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color.fromRGBO(232, 242, 249, 1),
      ),
      child: Column(
        children: [
          context.isWebOrLandScape()
              ? Row(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 12,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xFF3C8DBC),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text('My Courses ( $heading )',
                            style: const TextStyle(
                                fontSize: 16, overflow: TextOverflow.ellipsis))
                      ],
                    ),
                    const Spacer(),
                    searchBox(context, filterWithQueryText),
                  ],
                )
              : Column(
                  children: [
                    INSPHeading(heading),
                    const SizedBox(
                      height: 16,
                    ),
                    searchBox(context, filterWithQueryText),
                  ],
                ),
          const SizedBox(
            height: 16,
          ),
          heading == "Mathematics" || heading == "Chemistry"
              ? Column(children: [
                  heading == "Mathematics"
                      ? Image.asset('assets/images/mathematics.png')
                      : Image.asset('assets/images/science.png'),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text("Coming Soon",
                      style: const TextStyle(fontSize: 20))
                ])
              : lecturesWidgetAppState
                      .filteredLectureForSelectedCourse.isNotEmpty
                  ? GridView.builder(
                      itemCount: lecturesWidgetAppState
                          .filteredLectureForSelectedCourse.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        final cardModel = lecturesWidgetAppState
                            .filteredLectureForSelectedCourse[index];
                        return INSPLectureCard(
                            lectureCardModel: cardModel,
                            context: context,
                            onPressedViewDetails: onPressedMyCourse);
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: context.isWebOrLandScape() ? 3 : 1,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          mainAxisExtent: 230),
                    )
                  : const Center(child: Text('No items')),
        ],
      ),
    );
  }
}
