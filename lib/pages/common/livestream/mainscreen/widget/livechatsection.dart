import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/pages/common/livestream/mainscreen/widget/liveclassdetail.dart';
import 'package:inspflutterfrontend/pages/common/livestream/mainscreen/widget/liveleftpart.dart';
import 'package:inspflutterfrontend/pages/common/livestream/models/peers_model.dart';

class LiveChatSectionWidget extends StatelessWidget {
  final List<PeersDataModel> allPeers;
  // final Function(BuildContext, RecordingPlayerCard) onViewDetailsClicked;

  LiveChatSectionWidget({
    required this.allPeers,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.85,
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                LiveClassDetail(),
                const SizedBox(height: 20),
                LiveLeftPart()
              ],
            )));
  }
}
