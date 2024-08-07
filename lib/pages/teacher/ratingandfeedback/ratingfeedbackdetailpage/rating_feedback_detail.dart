import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/pages/common/courses/widget/chapterdetail/chapter_widget.dart';
import 'package:inspflutterfrontend/pages/teacher/ratingandfeedback/ratingfeedbackdetailpage/rating_feedback_detail_redux.dart';
import 'package:inspflutterfrontend/pages/teacher/ratingandfeedback/ratingfeedbackdetailpage/widget/rating_feedback_bottom_detail.dart';
import 'package:inspflutterfrontend/utils/extensions.dart';
import 'package:inspflutterfrontend/widget/card/model/insp_card_model.dart';
import 'package:inspflutterfrontend/widget/navbar/navbar.dart';
import 'package:inspflutterfrontend/pages/common/upcomingclasses/upcoming_class_screen.dart';

import '../../../../base/base.dart';

class RatingFeedbackDetail extends StatelessWidget {
  const RatingFeedbackDetail({super.key});

  @override
  Widget build(BuildContext context) {
    bool isWebOrLandScape = context.isWebOrLandScape();
    dispatch(context, initialFetchSubjectTopic(context));
    dispatch(context, initialRatingDetail(context));

    void onPressedTopic(BuildContext context, INSPCardModel inspCardModel) {
      // dispatch(context, sendToTopicLectureScreen(context, inspCardModel));
    }

    return Scaffold(
        appBar: Navbar(),
        body: StoreConnector<RatingFeedbackDetailAppState,
                RatingFeedbackDetailAppState>(
            converter: (store) => store.state,
            builder: (context, RatingFeedbackDetailAppState state) => Container(
                  padding: const EdgeInsets.all(10.0),
                  color: Colors.white,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: !isWebOrLandScape
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ChapterWidget(
                                  key: UniqueKey(),
                                  allTopicsForSelectedCourse: state.allTopic,
                                  onViewDetailsClicked: onPressedTopic),
                              const SizedBox(height: 16),
                              RatingFeedbackBottomWidgets(
                                  context: context,
                                  heading: state.selectedItem.name,
                                  ratingFeedbackCard: state.ratingFeedbackCard)
                            ],
                          )
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  flex: 9,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ChapterWidget(
                                          key: UniqueKey(),
                                          allTopicsForSelectedCourse:
                                              state.allTopic,
                                          onViewDetailsClicked: onPressedTopic),
                                      const SizedBox(height: 16),
                                      RatingFeedbackBottomWidgets(
                                          context: context,
                                          heading: state.selectedItem.name,
                                          ratingFeedbackCard:
                                              state.ratingFeedbackCard)
                                    ],
                                  )),
                              const SizedBox(width: 17),
                              if (isWebOrLandScape)
                                Expanded(
                                  flex: 3,
                                  child: UpcomingClassesScreen.getScreen(),
                                ),
                            ],
                          ),
                  ),
                )));
  }

  static getScreen(INSPCardModel selectedItem) {
    return getBaseScreen<RatingFeedbackDetailAppState, RatingFeedbackDetail>(
        ratingFeedbackDetailStateReducer,
        RatingFeedbackDetailAppState(selectedItem: selectedItem),
        const RatingFeedbackDetail());
  }

  static dispatch(BuildContext context, dynamic action) {
    baseDispatch<RatingFeedbackDetailAppState>(context, action);
  }
}
