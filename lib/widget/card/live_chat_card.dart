import 'package:flutter/material.dart';

Widget LiveChatCard(
    {required BuildContext context,
    required String username,
    required String feedback}) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          const Icon(Icons.account_circle, color: Colors.blue),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
              width: 100,
              child: Text(
                username,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    overflow: TextOverflow.ellipsis),
              )),
        ]),
        const SizedBox(
          height: 2,
        ),
        Text(
          feedback,
          style: const TextStyle(
              fontSize: 14, color: Colors.black, fontWeight: FontWeight.w400),
        ),
      ],
    ),
  );
}
