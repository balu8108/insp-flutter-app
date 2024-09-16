// This is the screen where one click see all from  mentor homepage.
import 'package:flutter/material.dart';
import 'package:insp/main.dart';
import 'package:insp/pages/common/alltopicswidget/all_topics_widget.dart';
import 'package:insp/pages/teacher/ratingandfeedback/ratingfeedbackdetailpage/screen/rating_feedback_detail.dart';
import 'package:insp/utils/extensions.dart';
import 'package:insp/widget/card/model/insp_card_model.dart';
import 'package:insp/pages/common/upcomingclasses/upcoming_class_screen.dart';

class RatingAndFeedback extends StatelessWidget {
  const RatingAndFeedback({super.key});
  @override
  Widget build(BuildContext context) {
    bool isWebOrLandScape = context.isWebOrLandScape();

    void onPressedMyCourse(BuildContext context, INSPCardModel inspCardModel) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MainScaffold(
                content: RatingFeedbackDetail.getScreen(inspCardModel))),
      );
    }

    return Container(
        padding: isWebOrLandScape
            ? const EdgeInsets.all(10.0)
            : const EdgeInsets.all(0.0),
        color: Colors.white,
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                flex: 9,
                child: Column(
                  children: [
                    AllTopicWidget.getScreen(
                        heading: 'Rating and Feedback',
                        onPressedViewDetails: onPressedMyCourse)
                  ],
                ),
              ),
              if (isWebOrLandScape) const SizedBox(width: 17),
              if (isWebOrLandScape)
                const Expanded(
                  flex: 3,
                  child: UpcomingClassesScreen(),
                ),
            ])));
  }
}
