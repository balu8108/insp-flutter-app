import 'package:flutter/material.dart';

Widget RatingFeedbackCard(
    {required BuildContext context,
    required String username,
    required String feedback}) {
  void onBackwardButton() {}

  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.blue),
            onPressed: onBackwardButton,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            username,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFF2C3329)),
          ),
        ]),
        const SizedBox(
          height: 6,
        ),
        Text(
          feedback,
          style: const TextStyle(
              fontSize: 11,
              color: Color.fromRGBO(44, 51, 41, 0.47),
              fontWeight: FontWeight.w400),
        ),
      ],
    ),
  );
}
