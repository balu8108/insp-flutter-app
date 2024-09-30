import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/pages/common/courses/widget/chapterdetail/chapter_widget.dart';
import 'package:insp/pages/teacher/ratingandfeedback/ratingfeedbackdetailpage/screen/rating_feedback_detail_redux.dart';
import 'package:insp/pages/teacher/ratingandfeedback/ratingfeedbackdetailpage/widget/rating_feedback_bottom_detail.dart';
import 'package:insp/utils/extensions.dart';
import 'package:insp/widget/card/model/insp_card_model.dart';
import 'package:insp/pages/common/upcomingclasses/upcoming_class_screen.dart';

import '../../../../../base/base.dart';

class RatingFeedbackDetail extends StatelessWidget {
  const RatingFeedbackDetail({super.key});

  @override
  Widget build(BuildContext context) {
    bool isWebOrLandScape = context.isWebOrLandScape();
    dispatch(context, initialFetchSubjectTopic(context));
    dispatch(context, initialRatingDetail(context));

    void onPressedTopic(BuildContext context, INSPCardModel inspCardModel) {
      dispatch(context, showRatingFeedbackDetail(context, inspCardModel));
    }

    return Container(
        padding: isWebOrLandScape
            ? const EdgeInsets.all(10.0)
            : const EdgeInsets.all(0.0),
        color: Colors.white,
        child: StoreConnector<RatingFeedbackDetailAppState,
            RatingFeedbackDetailAppState>(
          converter: (store) => store.state,
          builder: (context, RatingFeedbackDetailAppState state) =>
              SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: !isWebOrLandScape
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ChapterWidget(
                          title: "Rating & Feedback",
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ChapterWidget(
                                  title: "Rating & Feedback",
                                  key: UniqueKey(),
                                  allTopicsForSelectedCourse: state.allTopic,
                                  onViewDetailsClicked: onPressedTopic),
                              const SizedBox(height: 16),
                              RatingFeedbackBottomWidgets(
                                  context: context,
                                  heading: state.selectedItem.name,
                                  ratingFeedbackCard: state.ratingFeedbackCard)
                            ],
                          )),
                      if (isWebOrLandScape) const SizedBox(width: 17),
                      if (isWebOrLandScape)
                        const Expanded(
                          flex: 3,
                          child: UpcomingClassesScreen(),
                        ),
                    ],
                  ),
          ),
        ));
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
