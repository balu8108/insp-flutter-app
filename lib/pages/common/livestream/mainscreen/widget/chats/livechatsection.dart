import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/pages/common/livestream/mainscreen/widget/liveclassdetail.dart';
import 'package:inspflutterfrontend/pages/common/livestream/mainscreen/widget/chats/liveleftpart.dart';

class LiveChatSectionWidget extends StatelessWidget {
  LiveChatSectionWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.85,
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const LiveClassDetail(),
                const SizedBox(height: 20),
                LiveLeftPart(),
              ],
            )));
  }
}
