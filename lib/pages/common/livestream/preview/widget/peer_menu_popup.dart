import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/redux/AppState.dart';
import 'package:inspflutterfrontend/pages/common/livestream/widget/chat/peers_widget_redux.dart';
import 'package:inspflutterfrontend/widget/popups/kickpeer.dart';

class KickPeerWidget extends StatefulWidget {
  const KickPeerWidget({super.key, required this.peerId});

  final String peerId;

  @override
  _KickPeerWidgetState createState() => _KickPeerWidgetState();
}

class _KickPeerWidgetState extends State<KickPeerWidget> {
  static void dispatch(BuildContext context, PeersWidgetAppState action) {
    StoreProvider.of<AppState>(context).dispatch(action);
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: Colors.white,
      icon: const Icon(Icons.more_vert, size: 24.0),
      onSelected: (_) {},
      itemBuilder: (context) => [
        PopupMenuItem(
          child: StoreConnector<AppState, PeersWidgetAppState>(
            converter: (store) => store.state.peersWidgetAppState,
            builder: (context, state) => GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return KickPeerPopup();
                    },
                  );
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
                    const Text(
                      "Kick from class",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                )),
          ),
        ),
      ],
    );
  }
}
