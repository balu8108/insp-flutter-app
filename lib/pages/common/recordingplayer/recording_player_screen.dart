import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/pages/common/livestream/mainscreen/widget/videoPlayer/tpstreamview.dart';
import 'package:inspflutterfrontend/widget/card/model/recording_player_card_model.dart';
import 'package:inspflutterfrontend/widget/navbar/navbar.dart';
import 'package:inspflutterfrontend/pages/common/recordingplayer/recording_detail_widget.dart';
import 'package:inspflutterfrontend/pages/common/recordingplayer/recording_player_redux.dart';

import '../../../base/base.dart';

class RecordingPlayerScreen extends StatelessWidget {
  const RecordingPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void onPressedRecording(
        BuildContext context, RecordingPlayerCard recordingPlayerCard) {
      dispatch(context, selectRecordingData(context, recordingPlayerCard));
    }

    return Scaffold(
        appBar: Navbar(),
        body: StoreConnector<RecordingPlayerAppState, RecordingPlayerAppState>(
          converter: (store) => store.state,
          builder: (context, RecordingPlayerAppState state) => Container(
              padding: const EdgeInsets.all(10.0),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Expanded(flex: 7, child: TPStreamLiveVideoPlayerWidget()),
                      const SizedBox(width: 16),
                      Expanded(
                          flex: 3,
                          child: RecordingDetailWidget(
                              recordingPlayerDetail: state.selectedItem,
                              onViewDetailsClicked: onPressedRecording))
                    ],
                  ),
                ),
              )),
        ));
  }

  static getScreen(RecordingPlayerCard selectedItem) {
    return getBaseScreen<RecordingPlayerAppState, RecordingPlayerScreen>(
        recordingPlayerReducer,
        RecordingPlayerAppState(selectedItem: selectedItem),
        const RecordingPlayerScreen());
  }

  static dispatch(BuildContext context, dynamic action) {
    baseDispatch<RecordingPlayerAppState>(context, action);
  }
}
