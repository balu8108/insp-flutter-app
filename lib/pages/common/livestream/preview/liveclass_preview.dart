import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/pages/common/livestream/preview/widget/previewpage_detail.dart';
import 'package:inspflutterfrontend/pages/common/livestream/widget/chat/chat_widget_redux.dart';
import 'package:inspflutterfrontend/pages/common/recordingplayer/tpstream_video_player.dart';
import 'package:inspflutterfrontend/redux/AppState.dart';
import 'package:inspflutterfrontend/widget/navbar/navbar.dart';

class LiveClassPreviewScreen extends StatelessWidget {
  const LiveClassPreviewScreen({super.key});
  static void dispatch(BuildContext context, ChatWidgetAction action) {
    StoreProvider.of<AppState>(context).dispatch(action);
  }

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    store.dispatch(initialSetup(context));
    void navigateToRoomScreen() {
      store.dispatch(navigateToRoom(context, "GvhJqN2RQs", {}));
    }

    return Scaffold(
        appBar: Navbar(),
        body: StoreConnector<AppState, ChatWidgetAppState>(
          converter: (store) => store.state.chatWidgetAppState,
          builder: (context, ChatWidgetAppState state) => Container(
              padding: const EdgeInsets.all(10.0),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 7, child: TPStreamVideoPlayerWidget()),
                      const SizedBox(width: 16),
                      Expanded(
                          flex: 3,
                          child: LiveCLassPreviowlWidget(
                              allPeers: state.allPeers,
                              navigateToRoomScreen: navigateToRoomScreen))
                    ],
                  ),
                ),
              )),
        ));
  }
}
