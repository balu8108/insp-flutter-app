import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tpstreams_player_sdk/tpstreams_player_sdk.dart';
import 'package:insp/pages/common/livestream/widget/chat/tpstream_redux.dart';
import 'package:insp/redux/AppState.dart';

class TPStreamMobileVideoPlayer extends StatelessWidget {
  const TPStreamMobileVideoPlayer({super.key});

  static void dispatch(BuildContext context, TPStreamAppState action) {
    StoreProvider.of<AppState>(context).dispatch(action);
  }

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    store.dispatch(getVideoUrlApi(context));
    return StoreConnector<AppState, TPStreamAppState>(
      converter: (store) => store.state.tpStreamAppState,
      builder: (context, TPStreamAppState state) {
        return Column(children: [
          state.videoResponse.playback_url.isNotEmpty
              ? TPStreamPlayer(
                  assetId: state.accestId,
                  accessToken: state.videoResponse.code)
              : const Text("waiting...")
        ]);
      },
    );
  }
}
