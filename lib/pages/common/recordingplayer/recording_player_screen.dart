import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/pages/common/recordingplayer/tpStream_recorded_mobile_player.dart';
import 'package:insp/pages/common/recordingplayer/tpStream_recorded_player.dart';
import 'package:insp/pages/common/recordingplayer/recording_detail_widget.dart';
import 'package:insp/pages/common/recordingplayer/recording_player_redux.dart';
import 'package:insp/redux/AppState.dart';
import 'package:insp/utils/extensions.dart';

class RecordingPlayerScreen extends StatefulWidget {
  const RecordingPlayerScreen(
      {super.key, required this.classId, required this.classType});

  final String classId, classType;

  @override
  _RecordingPlayerScreenState createState() => _RecordingPlayerScreenState();
}

class _RecordingPlayerScreenState extends State<RecordingPlayerScreen> {
  @override
  void initState() {
    super.initState();
    final store = StoreProvider.of<AppState>(context, listen: false);
    store.dispatch(
        getRecordedVideoData(context, widget.classId, widget.classType));
  }

  void onPressedRecording(BuildContext context, String tpStreamId) {
    final store = StoreProvider.of<AppState>(context, listen: false);
    store.dispatch(getRecordedVideoUrlApi(context, tpStreamId));
  }

  void onUpdate() {
    final store = StoreProvider.of<AppState>(context, listen: false);
    store.dispatch(
        getRecordedVideoData(context, widget.classId, widget.classType));
  }

  @override
  Widget build(BuildContext context) {
    bool isWebOrLandScape = context.isWebOrLandScape();
    return Container(
        padding: const EdgeInsets.all(10.0),
        color: Colors.white,
        child: StoreConnector<AppState, RecordingPlayerAppState>(
          converter: (store) => store.state.recordingPlayerAppState,
          builder: (context, RecordingPlayerAppState state) {
            return Padding(
              padding: isWebOrLandScape
                  ? const EdgeInsets.all(16.0)
                  : const EdgeInsets.all(0.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth < 600) {
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TPStreamRecordedMobilePlayer(
                              accestID: state.accestId,
                              accessToken: state.videoResponse.code),
                          const SizedBox(height: 16),
                          RecordingDetailWidget(
                            recordingPlayerDetail: state.recordedVideoData,
                            onViewDetailsClicked: onPressedRecording,
                            onUpdate: onUpdate,
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 7,
                          child: TPStreamRecordedPlayer(
                              videourl: state.videoResponse.playback_url),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                            flex: 3,
                            child: SingleChildScrollView(
                              child: RecordingDetailWidget(
                                recordingPlayerDetail: state.recordedVideoData,
                                onViewDetailsClicked: onPressedRecording,
                                onUpdate: onUpdate,
                              ),
                            )),
                      ],
                    );
                  }
                },
              ),
            );
          },
        ));
  }
}
