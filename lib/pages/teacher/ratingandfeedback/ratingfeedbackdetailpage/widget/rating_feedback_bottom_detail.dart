// this is the header of the  assignments (Phyiscs , Chemistry , Mathemathics)
import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/widget/card/model/rating_feedback_card_model.dart';
import 'package:inspflutterfrontend/widget/card/rating_feedback_card.dart';
import 'package:inspflutterfrontend/widget/heading/insp_heading.dart';

Widget RatingFeedbackBottomWidgets(
    {required BuildContext context,
    required String heading,
    required List<RatingFeedbackCardModal> ratingFeedbackCard}) {
  final ScrollController _scrollController = ScrollController();
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
            Expanded(flex: 9, child: INSPHeading(heading)),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
            height: 500.0,
            child: ratingFeedbackCard.isNotEmpty
                ? Scrollbar(
                    controller: _scrollController,
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemCount: ratingFeedbackCard.length,
                      itemBuilder: (BuildContext context, int index) {
                        final cardModel = ratingFeedbackCard[index];
                        return RatingFeedbackCard(
                          context: context,
                          username: cardModel.raterName,
                          feedback: cardModel.feedback,
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 20,
                        );
                      },
                    ),
                  )
                : const Center(child: Text('No item')))
      ]));
}
