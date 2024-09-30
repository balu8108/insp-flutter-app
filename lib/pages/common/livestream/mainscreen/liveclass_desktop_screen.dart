import 'package:flutter/material.dart';
import 'package:insp/pages/common/livestream/mainscreen/peer_list.dart';
import 'package:insp/pages/common/livestream/mainscreen/widget/chats/livechatsection.dart';
import 'package:insp/pages/common/livestream/mainscreen/widget/videoPlayer/tpstreamview.dart';

class LiveClassDesktopScreen extends StatefulWidget {
  const LiveClassDesktopScreen({super.key});
  @override
  _LiveClassScreenState createState() => _LiveClassScreenState();
}

class _LiveClassScreenState extends State<LiveClassDesktopScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 2, child: LiveChatSectionWidget()), // Expanded here
          SizedBox(width: 16),
          Expanded(
            flex: 7,
            child: TPStreamLiveVideoPlayerWidget(), // Expanded here
          ),
          SizedBox(width: 20),
          PeerListWidget(),
        ],
      ),
    );
  }
}
