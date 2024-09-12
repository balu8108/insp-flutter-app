import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/pages/common/livestream/preview/widget/previewpage_detail.dart';
import 'package:inspflutterfrontend/pages/common/livestream/preview/widget/previewvideo.dart';

class LiveClassPreviewScreen extends StatelessWidget {
  final String roomId;

  const LiveClassPreviewScreen({
    Key? key,
    required this.roomId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10.0),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 7, child: PreviewVideo()),
                const SizedBox(width: 16),
                Expanded(
                    flex: 3, child: LiveCLassPreviowlWidget(roomId: roomId))
              ],
            ),
          ),
        ));
  }
}
