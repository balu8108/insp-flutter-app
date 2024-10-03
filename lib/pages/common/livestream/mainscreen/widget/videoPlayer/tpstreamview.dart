import 'package:flutter/material.dart';
import 'package:insp/pages/common/livestream/mainscreen/widget/videoPlayer/actionButton.dart';
import 'package:insp/pages/common/livestream/mainscreen/widget/videoPlayer/pollview.dart';
import 'package:insp/pages/common/livestream/mainscreen/widget/videoPlayer/tpStreamVideoPlayer.dart';
import 'package:insp/utils/userDetail/getUserDetail.dart';

class TPStreamLiveVideoPlayerWidget extends StatefulWidget {
  const TPStreamLiveVideoPlayerWidget(
      {super.key, required this.isFullScreen, required this.fullScreen});

  final bool isFullScreen;
  final Function() fullScreen;

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
    bool isTeacher = isTeacherLogin(context);
    return Stack(
      children: [
        Column(
          children: [
            const Expanded(
              child: TPStreamVideoPlayer(),
            ),
            _buildBottomBar(isTeacher),
          ],
        ),
        const PollViewWidget()
      ],
    );
  }

  // Refactored bottom bar
  Widget _buildBottomBar(bool isTeacher) {
    return Container(
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
        child: ActionButtonWidget(
            isTeacher: isTeacher,
            isFullScreen: widget.isFullScreen,
            fullScreen: widget.fullScreen));
  }
}
