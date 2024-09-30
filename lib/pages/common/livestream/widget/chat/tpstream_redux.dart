// This file is "main.dart"
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:insp/apiservices/models/tpstream/video_request_model.dart';
import 'package:insp/apiservices/models/tpstream/video_response_model.dart';
import 'package:insp/apiservices/remote_data_source.dart';
import 'package:insp/data/hardcoded/secret_key.dart';
import 'package:insp/redux/AppState.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux/redux.dart';
import 'package:toastification/toastification.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'tpstream_redux.freezed.dart';

@freezed
class TPStreamAppState with _$TPStreamAppState {
  const factory TPStreamAppState(
          {@Default('Not Started') String streamStatusChangeTo,
          @Default('') String accestId,
          @Default(VideoResponseModel()) VideoResponseModel videoResponse}) =
      _TPStreamAppState;
}

class UpdateVideoResponse extends TPStreamAction {
  VideoResponseModel videoResponse;
  UpdateVideoResponse({required this.videoResponse});
}

class UpdateAccestId extends TPStreamAction {
  String accestId;
  UpdateAccestId({required this.accestId});
}

class UpdateStreamStatusChangeTo extends TPStreamAction {
  String streamStatusChangeTo;
  UpdateStreamStatusChangeTo({required this.streamStatusChangeTo});
}

sealed class TPStreamAction {}

TPStreamAppState tpStreamStateReducer(TPStreamAppState state, dynamic action) {
  if (action is UpdateVideoResponse) {
    return state.copyWith(videoResponse: action.videoResponse);
  } else if (action is UpdateStreamStatusChangeTo) {
    return state.copyWith(streamStatusChangeTo: action.streamStatusChangeTo);
  } else if (action is UpdateAccestId) {
    return state.copyWith(accestId: action.accestId);
  }
  return state;
}

ThunkAction<AppState> getStatus(String message) {
  return (Store<AppState> store) async {
    try {
      store.dispatch(UpdateStreamStatusChangeTo(streamStatusChangeTo: message));
    } catch (error) {
      print("err");
    }
  };
}

ThunkAction<AppState> getVideoUrlApi(BuildContext context) {
  return (Store<AppState> store) async {
    try {
      final remoteDataSource = RemoteDataSource();
      final chatState = store.state.previewDataAppState;

      // Validate the data before making the API call
      if (chatState.previewData.liveClassRoomRecordings.isNotEmpty) {
        final recording = chatState.previewData.liveClassRoomRecordings[0];
        final tpStreamId = recording.tpStreamId;
        if (tpStreamId.isNotEmpty) {
          final previewData = await remoteDataSource.getVideoPlayUrl(
              tpStreamId, const VideoRequestModel(), tpStreamToken);

          VideoResponseModel videoResponseData =
              VideoResponseModel.fromJson(previewData.response.data);
          // Dispatch the action to update chat messages in the store
          store.dispatch(UpdateVideoResponse(videoResponse: videoResponseData));
          store.dispatch(UpdateAccestId(accestId: tpStreamId));
        } else {
          print("tpstream url null");
        }
      } else {
        print("tpreviewData null");
      }
    } catch (error) {
      toastification.show(
        context: context, // optional if you use ToastificationWrapper
        type: ToastificationType.error,
        style: ToastificationStyle.fillColored,
        autoCloseDuration: const Duration(seconds: 3),
        title: const Text('Some issue, please try again'),
        alignment: Alignment.topRight,
      );
    }
  };
}

ThunkAction<AppState> setTpStreamInitialData() {
  return (Store<AppState> store) async {
    store.dispatch(UpdateAccestId(accestId: ''));
    store.dispatch(
        UpdateVideoResponse(videoResponse: const VideoResponseModel()));
  };
}
