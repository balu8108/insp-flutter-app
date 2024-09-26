import 'package:flutter/material.dart';
import 'package:insp/data/hardcoded/library_subjects.dart';
import 'package:insp/main.dart';
import 'package:insp/pages/teacher/ratingandfeedback/ratingfeedbackdetailpage/screen/rating_feedback_detail.dart';
import 'package:insp/utils/extensions.dart';
import 'package:insp/widget/card/model/insp_card_model.dart';
import 'package:insp/widget/card/model/latest_completed_class_card_model.dart';

Widget LatestCompletedClassCard(
    {required LatestCompletedClassCardModel completedCardModel,
    required BuildContext context}) {
  return Card(
    elevation: 0,
    color: Colors.white,
    surfaceTintColor: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    child: Container(
      width: context.isWebOrLandScape()
          ? MediaQuery.of(context).size.width / 5
          : MediaQuery.of(context).size.width * 0.6,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            completedCardModel.topicName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFF2C3329)),
          ),
          Text(
            completedCardModel.mentorName,
            style: const TextStyle(color: Color(0x782C3329), fontSize: 12),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Description',
            style: TextStyle(
                fontSize: 12,
                color: Color(0xFF2C3329),
                fontWeight: FontWeight.w400),
          ),
          Text(
            completedCardModel.description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontSize: 11,
                color: Color.fromRGBO(44, 51, 41, 0.47),
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 16,
          ),
          Center(
              child: TextButton(
                  onPressed: () {
                    final topic = INSPCardModel(
                        completedCardModel.topicId,
                        completedCardModel.topicName,
                        "Nitin Sachan",
                        topicDescriptionConstants[
                                int.parse(completedCardModel.topicId)] ??
                            '');

                    pushWithoutAnimation(
                        context, RatingFeedbackDetail.getScreen(topic));
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    overlayColor: Colors.transparent,
                    splashFactory: NoSplash.splashFactory,
                  ),
                  child: const Text(
                    'View Details',
                    style: TextStyle(
                        color: Color(0xFF3C8DBC),
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                  )))
        ],
      ),
    ),
  );
}
