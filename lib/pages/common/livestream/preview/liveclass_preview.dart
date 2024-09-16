import 'package:flutter/material.dart';
import 'package:insp/pages/common/livestream/preview/widget/previewpage_detail.dart';
import 'package:insp/pages/common/livestream/preview/widget/previewvideo.dart';
import 'package:insp/utils/extensions.dart';

class LiveClassPreviewScreen extends StatelessWidget {
  final String roomId;

  const LiveClassPreviewScreen({
    Key? key,
    required this.roomId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isWebOrLandScape = context.isWebOrLandScape();
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: isWebOrLandScape
          ? const EdgeInsets.all(10.0)
          : const EdgeInsets.all(0.0),
      color: Colors.white,
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: isWebOrLandScape
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 7,
                      child: SizedBox(height: 700, child: PreviewVideo()),
                    ),
                    // Expanded(child: PreviewVideo()),
                    const SizedBox(width: 16),
                    Expanded(
                        flex: 3, child: LiveCLassPreviowlWidget(roomId: roomId))
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 200,
                      child: PreviewVideo(),
                    ),
                    const SizedBox(height: 20),
                    LiveCLassPreviowlWidget(roomId: roomId)
                  ],
                )),
    );
  }
}
