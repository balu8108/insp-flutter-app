import 'package:flutter/material.dart';
import 'package:insp/base/base.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/widget/inputField/textfield_withoutsuffix.dart';
import 'package:insp/widget/popups/rating/rating_redux.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingFeedbackPopup extends StatelessWidget {
  const RatingFeedbackPopup();

  @override
  Widget build(BuildContext context) {
    void createAssignment() {
      dispatch(context, rateClass(context));
    }

    return StoreConnector<RatingAppState, RatingAppState>(
        converter: (store) => store.state,
        builder: (context, RatingAppState state) => AlertDialog(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                title: const Row(
                  children: [
                    Text("Rating",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        )),
                    Spacer(),
                  ],
                ),
                content: Container(
                  height: 250,
                  width: 200, // Set your desired width here
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 20),
                        RatingBar.builder(
                          initialRating: state.rating,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            dispatch(context, UpdateRating(rating: rating));
                          },
                        ),
                        const SizedBox(height: 30),
                        TextFieldWithoutSuffix(
                            hintText: "Feedback",
                            value: state.feedback,
                            onChanged: (text) {
                              dispatch(context,
                                  UpdateFeedback(feedback: text ?? ''));
                            },
                            selectedValueError: state.feedbackError),
                      ],
                    ),
                  ),
                ),
                actions: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.20,
                          child: ElevatedButton(
                              onPressed: createAssignment,
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor:
                                    const Color.fromRGBO(60, 141, 188, 1),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              child: const Text("Send")),
                        ),
                      ])
                ]));
  }

  static getScreen(int feedbackId) {
    return getBaseScreen<RatingAppState, RatingFeedbackPopup>(
      ratingStateReducer,
      RatingAppState(feedbackId: feedbackId),
      RatingFeedbackPopup(),
    );
  }

  static dispatch(BuildContext context, dynamic action) {
    baseDispatch<RatingAppState>(context, action);
  }
}
