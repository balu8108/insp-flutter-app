// // This file is "main.dart"
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:insp/pages/common/livestream/models/Stream_model.dart';

// // required: associates our `main.dart` with the code generated by Freezed
// part 'stream_widget_redux.freezed.dart';

// @freezed
// class StreamWidgetAppState with _$StreamWidgetAppState {
//   const factory StreamWidgetAppState({
//     @Default([]) List<StreamDataModel> allStream,
//   }) = _StreamWidgetAppState;
// }

// class UpdateAllStream extends StreamWidgetAction {
//   List<StreamDataModel> allStream;
//   UpdateAllStream({required this.allStream});
// }

// sealed class StreamWidgetAction {}

// StreamWidgetAppState _StreamMessageStateReducer(
//     StreamWidgetAppState state, StreamWidgetAction action) {
//   switch (action) {
//     case UpdateAllStream():
//       return state.copyWith(allStream: action.allStream);
//   }
// }

// StreamWidgetAppState StreamMessageStateReducer(
//     StreamWidgetAppState state, dynamic action) {
//   var upState = _StreamMessageStateReducer(state, action);
//   return upState;
// }
