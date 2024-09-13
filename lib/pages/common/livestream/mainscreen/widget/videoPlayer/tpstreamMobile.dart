import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tpstreams_player_sdk/tpstreams_player_sdk.dart';
import 'package:inspflutterfrontend/pages/common/livestream/widget/chat/tpstream_redux.dart';
import 'package:inspflutterfrontend/redux/AppState.dart';

class TPStreamMobileVideoPlayer extends StatelessWidget {
  const TPStreamMobileVideoPlayer({super.key});

  static void dispatch(BuildContext context, TPStreamAppState action) {
    StoreProvider.of<AppState>(context).dispatch(action);
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TPStreamAppState>(
      converter: (store) => store.state.tpStreamAppState,
      builder: (context, TPStreamAppState state) {
        return Container(
            height: 500,
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              color: Color.fromRGBO(232, 242, 249, 1),
            ),
            child: TPStreamPlayer(
                assetId: '3NPP8bqGnQD',
                accessToken: '9015e71f-8597-4c09-9120-f9a1c07fd299'));
      },
    );
  }
}
