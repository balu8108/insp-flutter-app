import 'package:flutter/material.dart';
import 'package:insp/pages/common/livestream/mainscreen/widget/liveclassdetail.dart';
import 'package:insp/pages/common/livestream/mainscreen/widget/chats/liveleftpart.dart';

class LiveChatSectionWidget extends StatelessWidget {
  const LiveChatSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 200,
          child: LiveClassDetail(),
        ),
        const SizedBox(height: 20),
        //Expanded widget to take up the remaining space
        Expanded(
          child: LiveLeftPart(),
        ),
      ],
    );
  }
}
