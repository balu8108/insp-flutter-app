import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/pages/common/livestream/widget/chat/peers_widget_redux.dart';
import 'package:inspflutterfrontend/redux/AppState.dart';

class LivePeersFullListWidget extends StatelessWidget {
  static void dispatch(BuildContext context, PeersWidgetAction action) {
    StoreProvider.of<AppState>(context).dispatch(action);
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PeersWidgetAppState>(
        converter: (store) => store.state.peersWidgetAppState,
        builder: (context, PeersWidgetAppState state) {
          return ListView.builder(
            itemCount: state.filteredPeers.length,
            itemBuilder: (context, index) {
              final peer = state.filteredPeers[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                              width: 40,
                              height: 40,
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(60, 141, 188, 1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                    child: Text(
                                  peer.name[0].toUpperCase(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                )),
                              )),
                          const SizedBox(width: 10),
                          Text(
                            peer.name,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}
