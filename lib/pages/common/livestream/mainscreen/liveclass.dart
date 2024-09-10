import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/pages/common/livestream/mainscreen/peer_list.dart';
import 'package:inspflutterfrontend/pages/common/livestream/mainscreen/widget/chats/livechatsection.dart';
import 'package:inspflutterfrontend/pages/common/livestream/mainscreen/widget/videoPlayer/tpstreamview.dart';
import 'package:inspflutterfrontend/widget/navbar/navbar.dart';

class LiveClassScreen extends StatefulWidget {
  const LiveClassScreen({super.key});
  @override
  _LiveClassScreenState createState() => _LiveClassScreenState();
}

class _LiveClassScreenState extends State<LiveClassScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(),
        body: Container(
            padding: const EdgeInsets.all(10.0),
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const SizedBox(height: 10.0),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 2, child: LiveChatSectionWidget()),
                      const SizedBox(width: 16),
                      const Expanded(
                        flex: 7,
                        child: TPStreamLiveVideoPlayerWidget(),
                      ),
                      const SizedBox(width: 20),
                      PeerListWidget()
                    ],
                  ),
                )
              ],
            )));
  }
}
