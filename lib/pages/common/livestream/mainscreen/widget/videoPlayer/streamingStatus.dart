// import 'package:flutter/material.dart';
// import 'package:flutter_redux/flutter_redux.dart';
// import 'package:inspflutterfrontend/pages/common/livestream/widget/chat/tpstream_redux.dart';
// import 'package:inspflutterfrontend/redux/AppState.dart';

// class StreamingStatusWidget extends StatelessWidget {
//   const StreamingStatusWidget({super.key});

//   static void dispatch(BuildContext context, TPStreamAppState action) {
//     StoreProvider.of<AppState>(context).dispatch(action);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return StoreConnector<AppState, TPStreamAppState>(
//       converter: (store) => store.state.tpStreamAppState,
//       builder: (context, TPStreamAppState state) {
//         final streamStatus = state.streamStatusChangeTo.isEmpty
//             ? "Not Started"
//             : state.streamStatusChangeTo;
//         return Text("Livestream Status: $streamStatus");
//       },
//     );
//   }
// }
