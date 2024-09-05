import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/pages/common/livestream/mainscreen/widget/videoPlayer/actionButton.dart';
import 'package:inspflutterfrontend/pages/common/livestream/mainscreen/widget/videoPlayer/pollview.dart';
import 'package:inspflutterfrontend/pages/common/livestream/mainscreen/widget/videoPlayer/tpStreamVideoPlayer.dart';

class TPStreamLiveVideoPlayerWidget extends StatefulWidget {
  const TPStreamLiveVideoPlayerWidget({super.key});

  @override
  _TPStreamLiveVideoPlayerWidgetState createState() =>
      _TPStreamLiveVideoPlayerWidgetState();
}

class _TPStreamLiveVideoPlayerWidgetState
    extends State<TPStreamLiveVideoPlayerWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const TPStreamVideoPlayer(),
            Container(
                height: 50,
                width: double.infinity,
                padding: const EdgeInsets.only(left: 16),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  color: Color.fromRGBO(232, 242, 249, 1),
                ),
                child: const ActionButtonWidget())
          ],
        ),
        const PollViewWidget()
      ],
    );
  }
}
