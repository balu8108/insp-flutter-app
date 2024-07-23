import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/common/insp_heading.dart';
import 'package:inspflutterfrontend/common/latest_completed_class_card.dart';
import 'package:inspflutterfrontend/common/model/latest_completed_class_card_model.dart';
import 'package:inspflutterfrontend/data/remote/remote_data_source.dart';
import 'package:inspflutterfrontend/rating_and_feedback/rating_and_feedback_widget_redux.dart';

import '../utils/capitalize.dart';

class RatingFeedbackScreen extends StatefulWidget {
  const RatingFeedbackScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return RatingFeedbackWidgetState();
  }
}

class RatingFeedbackWidgetState extends State {
  RatingFeedbackWidgetAppState ratingFeedbackWidgetAppState =
      const RatingFeedbackWidgetAppState(latestCompletedClassData: []);

  RatingFeedbackWidgetState();

  ScrollController _scrollController = ScrollController();

  void updateState(RatingFeedbackWidgetAppState ratingFeedbackWidgetAppState) {
    setState(() {
      this.ratingFeedbackWidgetAppState = ratingFeedbackWidgetAppState;
    });
  }

  // call an API of get all subjects
  void getAllLatestCompletedClasses() async {
    final remoteDataSource = RemoteDataSource();
    const token = 'Token 7e7caea58181517cdef5992796eafecb';
    final latestCompletedClass =
        await remoteDataSource.getLatestCompletedClasses(token);
    if (latestCompletedClass.data.data.isNotEmpty) {
      var allSubjectsResults = latestCompletedClass.data.data;

      final latestCompletedCardModels = allSubjectsResults
          .map((latestSoloClassResult) => LatestCompletedClassCardModel(
              latestSoloClassResult.id.toString(),
              latestSoloClassResult.liveClassRoomDetail.topicName == ""
                  ? "General"
                  : capitalizeFirstLetter(
                      latestSoloClassResult.liveClassRoomDetail.topicName),
              latestSoloClassResult.liveClassRoomDetail.topicId,
              latestSoloClassResult.mentorName,
              latestSoloClassResult.liveClassRoomDetail.description))
          .toList();

      updateState(ratingFeedbackWidgetAppState.copyWith(
          latestCompletedClassData: latestCompletedCardModels));
    }
  }

  @override
  void initState() {
    super.initState();
    getAllLatestCompletedClasses();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color.fromRGBO(232, 242, 249, 1),
      ),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            INSPHeading('Rating & Feedback'),
            const Text("See All",
                style:
                    TextStyle(fontSize: 12, overflow: TextOverflow.ellipsis)),
          ],
        ),
        const SizedBox(
          height: 17,
        ),
        SizedBox(
            height: 500.0,
            child:
                ratingFeedbackWidgetAppState.latestCompletedClassData.isNotEmpty
                    ? Scrollbar(
                        controller: _scrollController,
                        child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          itemCount: ratingFeedbackWidgetAppState
                              .latestCompletedClassData.length,
                          itemBuilder: (BuildContext context, int index) {
                            return LatestCompletedClassCard(
                                completedCardModel: ratingFeedbackWidgetAppState
                                    .latestCompletedClassData[index],
                                context: context);
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              width: 16,
                            );
                          },
                        ),
                      )
                    : const Center(child: Text('No item')))
      ]),
    );
  }
}
