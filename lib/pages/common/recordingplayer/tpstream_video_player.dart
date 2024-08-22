import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/pages/common/recordingplayer/webview.dart';
// import 'package:tpstreams_player_sdk/tpstreams_player_sdk.dart';

class TPStreamVideoPlayerWidget extends StatelessWidget {
  TPStreamVideoPlayerWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 600,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromRGBO(232, 242, 249, 1),
        ),
        child: MyApp());
  }
}
