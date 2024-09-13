import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/pages/common/livestream/mainscreen/peer_list.dart';
import 'package:inspflutterfrontend/pages/common/livestream/mainscreen/widget/chats/livechatsection.dart';
import 'package:inspflutterfrontend/pages/common/livestream/mainscreen/widget/chats/liveleftpart.dart';
import 'package:inspflutterfrontend/pages/common/livestream/mainscreen/widget/liveclassdetail.dart';
import 'package:inspflutterfrontend/pages/common/livestream/mainscreen/widget/videoPlayer/actionButton.dart';
import 'package:inspflutterfrontend/pages/common/livestream/mainscreen/widget/videoPlayer/tpStreamVideoPlayer.dart';
import 'package:inspflutterfrontend/pages/common/livestream/mainscreen/widget/videoPlayer/tpstreamMobile.dart';
import 'package:inspflutterfrontend/pages/common/livestream/mainscreen/widget/videoPlayer/tpstreamview.dart';
import 'package:inspflutterfrontend/utils/extensions.dart';

class LiveClassScreen extends StatefulWidget {
  const LiveClassScreen({super.key});
  @override
  _LiveClassScreenState createState() => _LiveClassScreenState();
}

class _LiveClassScreenState extends State<LiveClassScreen> {
  @override
  Widget build(BuildContext context) {
    bool isWebOrLandScape = context.isWebOrLandScape();
    return Container(
        padding: isWebOrLandScape
            ? const EdgeInsets.all(10.0)
            : const EdgeInsets.all(0.0),
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: isWebOrLandScape
            ? Expanded(
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
              ))
            : SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                        height: 500,
                        child: Column(
                          children: [
                            const TPStreamMobileVideoPlayer(),
                            // Container(
                            //     height: 50,
                            //     width: double.infinity,
                            //     padding: const EdgeInsets.only(left: 16),
                            //     decoration: const BoxDecoration(
                            //       borderRadius: BorderRadius.only(
                            //         bottomLeft: Radius.circular(16),
                            //         bottomRight: Radius.circular(16),
                            //       ),
                            //       color: Color.fromRGBO(232, 242, 249, 1),
                            //     ),
                            //     child: ActionButtonWidget(isTeacher: isTeacher))
                          ],
                        )),
                    const SizedBox(height: 20),
                    const SizedBox(
                      height: 200,
                      child: LiveClassDetail(),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 400,
                      child: LiveLeftPart(),
                    )
                    // const SizedBox(width: 16),
                    // const SizedBox(width: 20),
                    // PeerListWidget()
                  ],
                )));
  }
}
