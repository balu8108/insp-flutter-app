// import 'package:flutter/material.dart';
// import 'package:inspflutterfrontend/socket/socket_events.dart';
// import 'package:mediasoup_client_flutter/mediasoup_client_flutter.dart';
// import 'package:socket_io_client/socket_io_client.dart' as socket_io;

// class MediaSoupManager {
//   // socket variables
//   late socket_io.Socket socket;
//   late Device device;
//   Transport? producerTransport;
//   Transport? consumerTransport;

//   void socketConnectionHandler(String roomId) => {
//         socket.emitWithAck(SocketEvents.JOIN_ROOM_PREVIEW, {roomId: roomId},
//             ack: (res) {
//           if (res.success == true) {
//             // store.dispatch(setAllPeers(res.peers));
//           }
//         })
//       };

//   void socketNewPeerJoinedHandler(res) => {
//         // const { peer } = res;
//         // store.dispatch(setNewPeerJoined(peer));
//       };

//   void roomUpdateResponseHandler(res) => {
//         // send all peers to redux
//         // here we are getting all peers therefore we can directly set all peers without spreading
//         // store.dispatch(setAllPeers(res.peers));
//       };

//   void peerLeavedResponseHandler(res) => {
//         // const { peerLeaved } = res;
//         // // dispatch peer leaved action to remove the peer from peers list of redux stores
//         // store.dispatch(setPeerLeaved(peerLeaved));
//       };

//   void chatMsgResponseHandler(res) => {
//         // store.dispatch(setChatMessage(res));
//       };

//   void uploadFileResponseHandler(res) => {
//         // const { success, data } = res;
//         // if (success) {
//         //   store.dispatch(setUploadFilesInRoom(data));
//         // }
//       };

//   void questionResponseHandler(res) => {
//         // const { data } = res;
//         // store.dispatch(setQuestion(data));
//       };

//   Future<void> newProducerResponseHandler(
//       {required String producerId, required dynamic appData}) async {
//     try {
//       if (consumerTransport == null) {
//         await createRecvTransport();
//       }

//       await consumeMediaFromProducer(
//           consumerTransport!, producerId, consumerTransport!.id, appData);
//     } catch (err) {
//       // Handle error appropriately here, e.g., logging the error
//       print('Error in newProducerResponseHandler: $err');
//     }
//   }

//   Future<void> consumeMediaFromProducer(
//     dynamic consumerTransport,
//     String remoteProducerId,
//     String serverConsumerTransportId,
//     dynamic appData,
//   ) async {
//     socket.emitWithAck(
//       'CONSUME',
//       {
//         'rtpCapabilities':
//             device.rtpCapabilities, // Ensure device is properly defined
//         'remoteProducerId': remoteProducerId,
//         'serverConsumerTransportId': serverConsumerTransportId,
//         'appData': appData,
//       },
//       ack: (response) async {
//         final params = response['params'];
//         if (params['err'] != null) {
//           return;
//         }

//         final consumer = await consumerTransport.consume({
//           'id': params['id'],
//           'producerId': params['producerId'],
//           'kind': params['kind'],
//           'rtpParameters': params['rtpParameters'],
//           'appData': appData,
//         });

//         // Dispatch actions to your state management system.
//         if (consumer['appData'] != null) {
//           if (consumer['appData']['streamType'] == 'audioShare') {
//             //store.dispatch(setAudioConsumers(consumer));
//           } else if (consumer['appData']['streamType'] == 'screenShare' &&
//               consumer['appData']['isTeacher'] == true) {
//             //store.dispatch(setMentorScreenShareConsumer(consumer));
//           } else if (consumer['appData']['streamType'] == 'videoShare' &&
//               consumer['appData']['isTeacher'] == true) {
//             //store.dispatch(setMentorVideoShareConsumer(consumer));
//           } else {
//             //store.dispatch(setConsumers(consumer));
//           }
//         }

//         socket.emit('CONSUMER_RESUME', {
//           'serverConsumerId': params['serverConsumerId'],
//         });
//       },
//     );
//   }

//   Future<void> createRecvTransport() async {
//     return Future<void>(() async {
//       socket.emitWithAck('CREATE_WEB_RTC_TRANSPORT', {'consumer': true},
//           ack: (response) {
//         final params = response['params'];

//         if (params['err'] != null) {
//           throw Exception(params['err']);
//         }

//         try {
//           consumerTransport = device.createRecvTransport(
//               id: params.id,
//               iceParameters: params.iceParameters,
//               iceCandidates: params.iceCandidates,
//               dtlsParameters: params.dtlsParameters);
//         } catch (err) {
//           throw Exception('Failed to create receive transport');
//         }

//         // Listen for the connect event
//         consumerTransport?.on('connect', (dynamic data) async {
//           final dtlsParameters = data['dtlsParameters'];
//           try {
//             socket.emit('TRANSPORT_RECV_CONNECT', {
//               'dtlsParameters': dtlsParameters,
//               'serverConsumerTransportId': params['id'],
//             });
//           } catch (err) {
//             throw Exception(err.toString());
//           }
//         });
//         return;
//       });
//     });
//   }

//   void producerPausedResponseHandler(Map<String, dynamic> res) {
//     final String? remoteProducerId = res['remoteProducerId'];
//     final Map<String, dynamic>? appData = res['appData'];

//     // if (appData != null) {
//     //   if (appData['streamType'] == staticVariables.videoShare && appData['isTeacher'] == true) {
//     //     store.dispatch(SetMentorVideoSharePauseOrResume(true));
//     //   } else if (appData['streamType'] == staticVariables.screenShare && appData['isTeacher'] == true) {
//     //     store.dispatch(SetMentorScreenSharePauseOrResume(true));
//     //   } else if (appData['streamType'] == staticVariables.audioShare) {
//     //     // pause audio consumer
//     //     store.dispatch(SetAudioConsumerPauseOrResume(true, remoteProducerId));
//     //   }
//     // }
//   }

//   void connectToSocket() {
//     socket = socket_io.io('http://localhost:3000', <String, dynamic>{
//       'transports': ['websocket'],
//     });
//     String roomId = "";

//     socket.on(SocketEvents.CONNECT, (_) => socketConnectionHandler(roomId));
//     socket.on(SocketEvents.NEW_PEER_JOINED, socketNewPeerJoinedHandler);
//     socket.on(SocketEvents.ROOM_UPDATE, roomUpdateResponseHandler);
//     socket.on(SocketEvents.PEER_LEAVED, peerLeavedResponseHandler);
//     socket.on(SocketEvents.NEW_PRODUCER, newProducerResponseHandler);
//     socket.on(SocketEvents.CHAT_MSG_FROM_SERVER, chatMsgResponseHandler);
//     socket.on(SocketEvents.UPLOAD_FILE_FROM_SERVER, uploadFileResponseHandler);
//     socket.on(SocketEvents.QUESTION_SENT_FROM_SERVER, questionResponseHandler);
//     socket.on(SocketEvents.PRODUCER_PAUSED, producerPausedResponseHandler);
//     socket.on(SocketEvents.PRODUCER_RESUMED, producerResumeResponseHandler);
//   }
// }
