import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/pages/common/livestream/widget/chat/chat_widget_redux.dart';
import 'package:inspflutterfrontend/redux/AppState.dart';

class LivePeersListWidget extends StatelessWidget {
  LivePeersListWidget();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ChatWidgetAppState>(
        converter: (store) => store.state.chatWidgetAppState,
        builder: (context, ChatWidgetAppState state) => Container(
              // color: Colors.black,
              height: MediaQuery.of(context).size.height * 0.85,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: state.allPeers.map((peer) {
                    return Container(
                        width: 100,
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.only(
                            bottom: 8), // Add some spacing between peers
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(60, 141, 188, 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                peer.name[0]
                                    .toUpperCase(), // Display the first letter of the peer's name
                                style: const TextStyle(color: Colors.white),
                              ),
                            )));
                  }).toList(),
                ),
              ),
            ));
  }
}
