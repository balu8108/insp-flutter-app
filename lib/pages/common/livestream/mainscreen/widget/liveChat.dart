import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/widget/card/live_chat_card.dart';
import 'package:inspflutterfrontend/widget/card/model/rating_feedback_card_model.dart';

class LiveChat extends StatelessWidget {
  LiveChat();

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    final List<RatingFeedbackCardModal> ratingFeedbackCard = [
      const RatingFeedbackCardModal(
          'HArshitdsjfjdfhkjsdhksdjfhdsjkfhskdjfhkdsjfhdsjkfhdsjfhdskf',
          'testing',
          2),
      const RatingFeedbackCardModal(
          'HArshit HArshitdsjfjdfhkjsd hksdjfhdsjkfhsdjfhkdsjfhdsjkfhdsjfhdskf',
          'thrown resolving',
          5),
      const RatingFeedbackCardModal('HArshit', 'testing', 2),
      const RatingFeedbackCardModal('HArshit', 'thrown resolving', 5),
      const RatingFeedbackCardModal('HArshit', 'testing', 2),
      const RatingFeedbackCardModal('HArshit', 'thrown resolving', 5),
      const RatingFeedbackCardModal('HArshit', 'testing', 2),
      const RatingFeedbackCardModal('HArshit', 'thrown resolving', 5),
      const RatingFeedbackCardModal('HArshit', 'testing', 2),
      const RatingFeedbackCardModal('HArshit', 'thrown resolving', 5),
      const RatingFeedbackCardModal('HArshit', 'testing', 2),
      const RatingFeedbackCardModal('HArshit', 'thrown resolving', 5),
      const RatingFeedbackCardModal('HArshit', 'testing', 2),
      const RatingFeedbackCardModal('HArshit', 'thrown resolving', 5),
      const RatingFeedbackCardModal('HArshit', 'testing', 2),
      const RatingFeedbackCardModal('HArshit', 'thrown resolving', 5)
    ];
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
              flex: 9,
              child: ratingFeedbackCard.isNotEmpty
                  ? ListView.separated(
                      scrollDirection: Axis.vertical,
                      controller: scrollController,
                      itemCount: ratingFeedbackCard.length,
                      itemBuilder: (BuildContext context, int index) {
                        final cardModel = ratingFeedbackCard[index];
                        return LiveChatCard(
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
                    )
                  : const Center(child: Text('No item'))),
          const SizedBox(height: 10),
          Expanded(
              flex: 1,
              child: SizedBox(
                width: 300,
                child: TextField(
                  onChanged: (text) {},
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Try Something...',
                    hintStyle: const TextStyle(fontSize: 14),
                    prefixIcon: IconButton(
                      icon: const Icon(Icons.child_care),
                      iconSize: 16.0,
                      onPressed: () {
                        print("click");
                      },
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.send),
                      iconSize: 16.0,
                      onPressed: () {
                        print("click");
                      },
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 0, horizontal: 5), // Adjust padding
                  ),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF2C3329), // Text color
                  ),
                ),
              ))
        ]));
  }
}
