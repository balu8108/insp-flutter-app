import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/pages/teacher/ratingandfeedback/mainpage/rating_and_feedback.dart';
import 'package:inspflutterfrontend/utils/userDetail/getUserDetail.dart';
import 'package:inspflutterfrontend/widget/heading/insp_heading.dart';
import 'package:inspflutterfrontend/widget/card/latest_completed_class_card.dart';
import 'package:inspflutterfrontend/widget/card/model/latest_completed_class_card_model.dart';
import 'package:inspflutterfrontend/apiservices/remote_data_source.dart';
import 'package:inspflutterfrontend/pages/teacher/dashboard/ratingandfeedback/rating_and_feedback_widget_redux.dart';
import 'package:inspflutterfrontend/widget/loader/data_loader.dart';

import '../../../../utils/capitalize.dart';

class RatingFeedback extends StatefulWidget {
  const RatingFeedback({super.key});
  @override
  State<StatefulWidget> createState() {
    return RatingFeedbackWidgetState();
  }
}

class RatingFeedbackWidgetState extends State {
  RatingFeedbackWidgetAppState ratingFeedbackWidgetAppState =
      const RatingFeedbackWidgetAppState(latestCompletedClassData: []);

  RatingFeedbackWidgetState();

  final ScrollController _scrollController = ScrollController();
  bool _isLoading = true;

  void updateState(RatingFeedbackWidgetAppState ratingFeedbackWidgetAppState) {
    setState(() {
      this.ratingFeedbackWidgetAppState = ratingFeedbackWidgetAppState;
      _isLoading = false;
    });
  }

  // call an API of  latest fiished cleasses
  void getAllLatestCompletedClasses() async {
    final remoteDataSource = RemoteDataSource();
    String userToken = await getUserToken();
    final latestCompletedClass =
        await remoteDataSource.getLatestCompletedClasses(userToken);
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
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getAllLatestCompletedClasses();
  }

  void _handleSeeAll() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RatingAndFeedback()),
    );
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
            Expanded(flex: 5, child: INSPHeading('Rating & Feedback')),
            TextButton(
                onPressed: _handleSeeAll,
                child: const Text("See All",
                    style: TextStyle(
                        fontSize: 14,
                        overflow: TextOverflow.ellipsis,
                        color: Color(0xFF2C3329))))
          ],
        ),
        const SizedBox(
          height: 17,
        ),
        _isLoading
            ? DataLoader()
            : SizedBox(
                height: 500.0,
                child: ratingFeedbackWidgetAppState
                        .latestCompletedClassData.isNotEmpty
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
