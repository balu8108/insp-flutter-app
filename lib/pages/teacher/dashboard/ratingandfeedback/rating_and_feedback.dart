import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/base/base.dart';
import 'package:insp/main.dart';
import 'package:insp/pages/teacher/ratingandfeedback/mainpage/rating_and_feedback.dart';
import 'package:insp/widget/heading/insp_heading.dart';
import 'package:insp/widget/card/latest_completed_class_card.dart';
import 'package:insp/pages/teacher/dashboard/ratingandfeedback/rating_and_feedback_widget_redux.dart';

class RatingFeedback extends StatelessWidget {
  const RatingFeedback({super.key});

  @override
  Widget build(BuildContext context) {
    dispatch(context, getLatestCompletedClass(context));
    final ScrollController scrollController = ScrollController();

    void handleSeeAll() {
      pushWithoutAnimation(context, const RatingAndFeedback());
    }

    return StoreConnector<RatingFeedbackWidgetAppState,
            RatingFeedbackWidgetAppState>(
        converter: (store) => store.state,
        builder: (context, RatingFeedbackWidgetAppState state) => Container(
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
                        onPressed: handleSeeAll,
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
                SizedBox(
                    height: 500.0,
                    child: state.latestCompletedClassData.isNotEmpty
                        ? Scrollbar(
                            controller: scrollController,
                            child: ListView.separated(
                              scrollDirection: Axis.vertical,
                              controller: scrollController,
                              itemCount: state.latestCompletedClassData.length,
                              itemBuilder: (BuildContext context, int index) {
                                return LatestCompletedClassCard(
                                    completedCardModel:
                                        state.latestCompletedClassData[index],
                                    context: context);
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(
                                  width: 16,
                                );
                              },
                            ),
                          )
                        : const Center(child: Text('No item')))
              ]),
            ));
  }

  static getScreen() {
    return getBaseScreen<RatingFeedbackWidgetAppState, RatingFeedback>(
        ratingFeedbackWidgetReducer,
        const RatingFeedbackWidgetAppState(),
        const RatingFeedback());
  }

  static dispatch(BuildContext context, dynamic action) {
    baseDispatch<RatingFeedbackWidgetAppState>(context, action);
  }
}
