import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/base/base.dart';
import 'package:inspflutterfrontend/pages/common/livestream/mainscreen/widget/livechatsection.dart';
import 'package:inspflutterfrontend/pages/common/livestream/mainscreen/widget/livepeerslist.dart';
import 'package:inspflutterfrontend/pages/common/livestream/widget/chat/chat_widget_redux.dart';
import 'package:inspflutterfrontend/pages/common/recordingplayer/tpstream_video_player.dart';
import 'package:inspflutterfrontend/widget/navbar/navbar.dart';

class LiveClassScreen extends StatelessWidget {
  const LiveClassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(),
        body: StoreConnector<ChatWidgetAppState, ChatWidgetAppState>(
          converter: (store) => store.state,
          builder: (context, ChatWidgetAppState state) => Container(
              padding: const EdgeInsets.all(10.0),
              color: Colors.white,
              height: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 2, child: LiveChatSectionWidget(allPeers: [])),
                      const SizedBox(width: 16),
                      Expanded(flex: 7, child: TPStreamVideoPlayerWidget()),
                      const SizedBox(width: 16),
                      Expanded(
                          flex: 1,
                          child: LivePeersListWidget(allPeers: state.allPeers))
                    ],
                  ),
                ),
              )),
        ));
  }

  static getScreen() {
    return getBaseScreen<ChatWidgetAppState, LiveClassScreen>(
        chatMessageStateReducer, ChatWidgetAppState(), const LiveClassScreen());
  }

  static dispatch(BuildContext context, dynamic action) {
    baseDispatch<ChatWidgetAppState>(context, action);
  }
}
