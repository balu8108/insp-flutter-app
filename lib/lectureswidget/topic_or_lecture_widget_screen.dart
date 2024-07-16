import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/common/extensions.dart';
import 'package:inspflutterfrontend/common/insp_card.dart';
import 'package:inspflutterfrontend/common/insp_heading.dart';
import 'package:inspflutterfrontend/common/model/insp_card_model.dart';
import 'package:inspflutterfrontend/common/model/lecture_card_model.dart';

import '../common/insp_lecture_card.dart';
import '../common/search_box.dart';
import '../data/hardcoded/secret_key.dart';
import '../data/remote/remote_data_source.dart';
import 'topic_or_lecture_widget_state.dart';

class TopicOrLectureWidget extends StatefulWidget {
  const TopicOrLectureWidget(
      {super.key,
      required this.onViewDetailsClicked,
      required this.heading,
      required this.data});

  final void Function(BuildContext, INSPCardModel) onViewDetailsClicked;

  final String heading;

  final data;

  @override
  State<StatefulWidget> createState() {
    return TopicOrLectureWidgetState(onViewDetailsClicked, heading, data);
  }
}

class TopicOrLectureWidgetState extends State<TopicOrLectureWidget> {
  TopicOrLectureWidgetState(this.onViewDetailsClicked, this.heading, this.data);

  final void Function(BuildContext, INSPCardModel) onViewDetailsClicked;

  // final List<LectureCardModel> lectureCards;

  final String heading;

  final data;

  LecturesWidgetAppState lecturesWidgetAppState = LecturesWidgetAppState();

  void updateState(LecturesWidgetAppState lecturesWidgetAppState) {
    setState(() {
      this.lecturesWidgetAppState = lecturesWidgetAppState;
    });
  }

  // call an API of get all subjects
  void getAllLecture() async {
    final remoteDataSource = RemoteDataSource();
    const token = 'Token 01b7fdd87854f0fedb5af2b559318f2e';
    final allLecture = await remoteDataSource.getAllLecturesForCourse(
        "CRASHCOURSE", "ALL", token);
    if (allLecture.data.message == "All lecture data") {
      //AllLecturesForCourseResponseModelData
      var allSubjectsResults = allLecture.data.data;

      final inspLectureCardModels = allSubjectsResults
          .map((allSubjectResult) => LectureCardModel(
              allSubjectResult.id.toString() ?? '',
              'Lecture ${allSubjectResult.liveClassRoomDetail.lectureNo.toString()}' ??
                  '',
              allSubjectResult.classStatus ?? '',
              allSubjectResult.liveClassRoomDetail.description ?? '',
              allSubjectResult.liveClassRoomDetail.topicName ?? '',
              allSubjectResult.scheduledDate ?? '',
              allSubjectResult.classLevel))
          .toList();
      updateState(lecturesWidgetAppState.copyWith(
          filteredLectureForSelectedCourse: inspLectureCardModels));
    }
  }

  @override
  void initState() {
    super.initState();
    getAllLecture();
  }

  @override
  Widget build(BuildContext context) {
    void filterWithQueryText(String query) {
      updateState(lecturesWidgetAppState.copyWith(query: query));
      final filteredTopics =
          lecturesWidgetAppState.allLectureForSelectedCourse.where((it) {
        if (it is LectureCardModel) {
          return it.topicName.toLowerCase().contains(query.toLowerCase());
        } else {
          return it.name.toLowerCase().contains(query.toLowerCase());
        }
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
                    INSPHeading(heading),
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
          lecturesWidgetAppState.filteredLectureForSelectedCourse.isNotEmpty
              ? GridView.builder(
                  itemCount: lecturesWidgetAppState
                      .filteredLectureForSelectedCourse.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    final cardModel = lecturesWidgetAppState
                        .filteredLectureForSelectedCourse[index];
                    if (cardModel is LectureCardModel) {
                      return INSPLectureCard(
                          lectureCardModel: cardModel,
                          context: context,
                          onPressedViewDetails: (LectureCardModel) {});
                    }
                    // return INSPCard(
                    //     inspCardModel: cardModel,
                    //     context: context,
                    //     onPressedViewDetails: (BuildContext, INSPCardModel) {});
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
