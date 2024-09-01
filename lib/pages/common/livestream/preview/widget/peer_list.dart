import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/pages/common/livestream/models/peers_model.dart';

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
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    const Color.fromRGBO(60, 141, 188, 1),
                                radius: 12, // Equivalent to size "sm"
                                child: Text(
                                  peer.name[0]
                                      .toUpperCase(), // Display the first letter of the name
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10), // Add space between containers
                      ],
                    );
                  }).toList(),
                  if (peers.length > 3)
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: CircleAvatar(
                        backgroundColor: const Color.fromRGBO(60, 141, 188, 1),
                        radius: 12, // Equivalent to size "sm"
                        child: Text(
                          '+${peers.length - 3}', // Display the remaining count
                          style: const TextStyle(color: Colors.white),
                        ),
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
