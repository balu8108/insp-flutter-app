import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/base/base.dart';
import 'package:inspflutterfrontend/pages/common/livestream/preview/widget/previewpage_detail.dart';
import 'package:inspflutterfrontend/pages/common/livestream/widget/chat/chat_widget_redux.dart';
import 'package:inspflutterfrontend/pages/common/recordingplayer/tpstream_video_player.dart';
import 'package:inspflutterfrontend/widget/navbar/navbar.dart';

class LiveClassPreviewScreen extends StatelessWidget {
  const LiveClassPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    dispatch(context, initialSetup(context));
    void navigateToRoomScreen() {
      dispatch(context, navigateToRoom(context, "srvsgDWKiQ", {}));
    }

    return Scaffold(
        appBar: Navbar(),
        body: StoreConnector<ChatWidgetAppState, ChatWidgetAppState>(
          converter: (store) => store.state,
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

  static getScreen() {
    return getBaseScreen<ChatWidgetAppState, LiveClassPreviewScreen>(
        chatMessageStateReducer,
        ChatWidgetAppState(),
        const LiveClassPreviewScreen());
  }

  static dispatch(BuildContext context, dynamic action) {
    baseDispatch<ChatWidgetAppState>(context, action);
  }
}
