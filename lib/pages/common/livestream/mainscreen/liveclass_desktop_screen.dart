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
  bool isFullScreen = false;

  void _changeFullScreen() {
    setState(() {
      isFullScreen = !isFullScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isFullScreen)
            const Expanded(
                flex: 2, child: LiveChatSectionWidget()), // Expanded here
          if (!isFullScreen) const SizedBox(width: 16),
          Expanded(
            flex: isFullScreen ? 10 : 7,
            child: TPStreamLiveVideoPlayerWidget(
                isFullScreen: isFullScreen,
                fullScreen: _changeFullScreen), // Expanded here
          ),
          if (!isFullScreen) const SizedBox(width: 20),
          if (!isFullScreen) const PeerListWidget(),
        ],
      ),
    );
  }
}
