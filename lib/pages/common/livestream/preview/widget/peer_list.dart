import 'package:flutter/material.dart';
import 'package:insp/pages/common/livestream/models/peers_model.dart';

class PeerList extends StatelessWidget {
  List<PeersDataModel> peers;
  final String type, message;

  PeerList({required this.peers, required this.type, required this.message});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> liveSessionData = {
      'mentor': 'Mentor',
      'noMentorsJoined': 'No mentors joined',
      'noStudentsJoined': 'No students joined',
      'student': 'Student',
    };

    return Container(
        child: peers.isNotEmpty
            ? Row(
                children: [
                  ...peers.take(3).map((peer) {
                    return Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            backgroundBlendMode: BlendMode.multiply,
                            borderRadius: BorderRadius.circular(12),
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
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500),
                            )),
                          ),
                        ),
                        const SizedBox(
                            width: 8), // Add space between containers
                      ],
                    );
                  }).toList(),
                  if (peers.length > 3)
                    Container(
                      width: 50,
                      height: 50,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        backgroundBlendMode: BlendMode.multiply,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(60, 141, 188, 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                            child: Text(
                          '+${peers.length - 3}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w500),
                        )),
                      ),
                    ),
                ],
              )
            : Text(
                message,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ));
  }
}
