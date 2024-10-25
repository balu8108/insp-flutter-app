import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/redux/AppState.dart';
import 'package:insp/pages/common/livestream/widget/chat/peers_widget_redux.dart';
import 'package:insp/socket/mainsocket.dart';
import 'package:insp/widget/popups/kickpeer.dart';

class KickPeerWidget extends StatefulWidget {
  const KickPeerWidget(
      {super.key,
      required this.isTeacher,
      required this.peerId,
      required this.socketId});

  final String peerId, socketId;
  final bool isTeacher;

  @override
  _KickPeerWidgetState createState() => _KickPeerWidgetState();
}

class _KickPeerWidgetState extends State<KickPeerWidget> {
  void kickStudent() {
    kickOutFromClass(widget.socketId, widget.peerId);
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: Colors.white,
      icon: const Icon(Icons.more_vert, size: 24.0),
      onSelected: (_) {},
      itemBuilder: (context) => [
        PopupMenuItem(
          enabled: false,
          child: StoreConnector<AppState, PeersWidgetAppState>(
            converter: (store) => store.state.peersWidgetAppState,
            builder: (context, state) => GestureDetector(
                onTap: () {
                  if (!widget.isTeacher) {
                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return KickPeerPopup(callKickApi: kickStudent);
                      },
                    );
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove_circle_outline),
                      iconSize: 16.0,
                      onPressed: () {},
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      "Kick from class",
                      style: TextStyle(
                          color: widget.isTeacher ? Colors.grey : Colors.black),
                    ),
                  ],
                )),
          ),
        ),
      ],
    );
  }
}
