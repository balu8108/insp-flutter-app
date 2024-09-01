// This is the screen where one click see all from  mentor homepage.
import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/pages/common/alltopicswidget/all_topics_widget.dart';
import 'package:inspflutterfrontend/pages/teacher/ratingandfeedback/ratingfeedbackdetailpage/screen/rating_feedback_detail.dart';
import 'package:inspflutterfrontend/widget/card/model/insp_card_model.dart';
import 'package:inspflutterfrontend/widget/navbar/navbar.dart';
import 'package:inspflutterfrontend/pages/common/upcomingclasses/upcoming_class_screen.dart';

class RatingAndFeedback extends StatelessWidget {
  const RatingAndFeedback({super.key});
  @override
  Widget build(BuildContext context) {
    void onPressedMyCourse(BuildContext context, INSPCardModel inspCardModel) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                RatingFeedbackDetail.getScreen(inspCardModel)),
      );
    }

    return Scaffold(
        appBar: Navbar(),
        body: Container(
            padding: const EdgeInsets.all(10.0),
            color: Colors.white,
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                          const SizedBox(width: 17),
                          Expanded(
                            flex: 3,
                            child: const UpcomingClassesScreen(),
                          ),
                        ])))));
  }
}
