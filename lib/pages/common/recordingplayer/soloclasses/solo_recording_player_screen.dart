import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/pages/common/recordingplayer/soloclasses/solo_recording_detail_widget.dart';
import 'package:insp/pages/common/recordingplayer/tpStream_recorded_mobile_player.dart';
import 'package:insp/pages/common/recordingplayer/tpStream_recorded_player.dart';
import 'package:insp/pages/common/recordingplayer/recording_player_redux.dart';
import 'package:insp/redux/AppState.dart';
import 'package:insp/utils/extensions.dart';

class SoloRecordingPlayerScreen extends StatefulWidget {
  const SoloRecordingPlayerScreen({super.key, required this.classId});

  final String classId;

  @override
  _SoloRecordingPlayerScreenState createState() =>
      _SoloRecordingPlayerScreenState();
}

class _SoloRecordingPlayerScreenState extends State<SoloRecordingPlayerScreen> {
  @override
  void initState() {
    super.initState();
  }

  void onPressedRecording(BuildContext context, String tpStreamId) {
    final store = StoreProvider.of<AppState>(context, listen: false);
    store.dispatch(getRecordedVideoUrlApi(context, tpStreamId));
  }

  void onUpdate() {
    final store = StoreProvider.of<AppState>(context, listen: false);
    store.dispatch(getSoloRecordedVideoData(context, widget.classId));
  }

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context, listen: false);
    store.dispatch(getSoloRecordedVideoData(context, widget.classId));
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
                          SoloRecordingDetailWidget(
                            recordingSoloPlayerDetail:
                                state.soloRecordedVideoData,
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
                              child: SoloRecordingDetailWidget(
                                recordingSoloPlayerDetail:
                                    state.soloRecordedVideoData,
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
