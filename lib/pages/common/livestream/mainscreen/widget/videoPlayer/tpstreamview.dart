import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/pages/common/livestream/mainscreen/widget/videoPlayer/actionButton.dart';
import 'package:inspflutterfrontend/pages/common/livestream/mainscreen/widget/videoPlayer/pollview.dart';
import 'package:inspflutterfrontend/pages/common/livestream/mainscreen/widget/videoPlayer/tpStreamVideoPlayer.dart';
import 'package:inspflutterfrontend/utils/userDetail/getUserDetail.dart';

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
    return FutureBuilder<bool>(
        future: isTeacherLogin(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading data'));
          } else {
            bool isTeacher = snapshot.data ?? false;
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
                        child: ActionButtonWidget(isTeacher: isTeacher))
                  ],
                ),
                const PollViewWidget()
              ],
            );
          }
        });
  }
}
