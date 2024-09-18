// This file is "main.dart"
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:insp/apiservices/models/recording/view_recording_response_model.dart';
import 'package:insp/apiservices/models/tpstream/video_request_model.dart';
import 'package:insp/apiservices/models/tpstream/video_response_model.dart';
import 'package:insp/apiservices/remote_data_source.dart';
import 'package:insp/utils/userDetail/getUserDetail.dart';
import 'package:insp/widget/card/model/recording_player_card_model.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux/redux.dart';
import 'package:toastification/toastification.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'recording_player_redux.freezed.dart';

@freezed
class RecordingPlayerAppState with _$RecordingPlayerAppState {
  const factory RecordingPlayerAppState(
          {required String type,
          required String classId,
          @Default(RecordVideoResponseModelData())
          RecordVideoResponseModelData recordedVideoData,
          @Default(RecordingPlayerCard('', '', '', [], [], ''))
          RecordingPlayerCard selectedItem,
          @Default('') String accestId,
          @Default(VideoResponseModel()) VideoResponseModel videoResponse}) =
      _RecordingPlayerAppState;
}

class UpdateRecordVideoData extends RecordingPlayerAction {
  RecordVideoResponseModelData recordedVideoData;
  UpdateRecordVideoData({required this.recordedVideoData});
}

class UpdateSelectedItem extends RecordingPlayerAction {
  RecordingPlayerCard selectedItem;
  UpdateSelectedItem({required this.selectedItem});
}

class UpdateVideosResponse extends RecordingPlayerAction {
  VideoResponseModel videoResponse;
  UpdateVideosResponse({required this.videoResponse});
}

class UpdateAccestId extends RecordingPlayerAction {
  String accestId;
  UpdateAccestId({required this.accestId});
}

RecordingPlayerAppState recordingPlayerReducer(
    RecordingPlayerAppState state, dynamic action) {
  var upState = _recordingPlayerReducer(state, action);
  if (kDebugMode) {}
  return upState;
}

sealed class RecordingPlayerAction {}

RecordingPlayerAppState _recordingPlayerReducer(
    RecordingPlayerAppState state, RecordingPlayerAction action) {
  switch (action) {
    case UpdateSelectedItem():
      return state.copyWith(selectedItem: action.selectedItem);
    case UpdateRecordVideoData():
      return state.copyWith(recordedVideoData: action.recordedVideoData);
    case UpdateVideosResponse():
      return state.copyWith(videoResponse: action.videoResponse);
    case UpdateAccestId():
      return state.copyWith(accestId: action.accestId);
  }
}

ThunkAction<RecordingPlayerAppState> getRecordedVideoData(
    BuildContext context) {
  return (Store<RecordingPlayerAppState> store) async {
    try {
      final remoteDataSource = RemoteDataSource();
      if (store.state.type.isNotEmpty && store.state.classId.isNotEmpty) {
        String userToken = getUserToken(context);
        final previewData = await remoteDataSource.getRecordingData(
            store.state.type, store.state.classId, userToken);

        if (previewData.response.statusCode == 200) {
          ViewRecordingResponseModel recordedVideoDatas =
              ViewRecordingResponseModel.fromJson(previewData.response.data);
          store.dispatch(UpdateRecordVideoData(
              recordedVideoData: recordedVideoDatas.data));

          store.dispatch(getRecordedVideoUrlApi(context,
              recordedVideoDatas.data.liveClassRoomRecordings[0].tpStreamId));
        }
      } else {
        print("tpstream url null");
      }
    } catch (error) {
      print(error);
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

ThunkAction<RecordingPlayerAppState> getRecordedVideoUrlApi(
    BuildContext context, String tpStreamId) {
  return (Store<RecordingPlayerAppState> store) async {
    try {
      final remoteDataSource = RemoteDataSource();
      // Validate the data before making the API call
      if (tpStreamId.isNotEmpty) {
        final previewData = await remoteDataSource.getVideoPlayUrl(
            tpStreamId,
            const VideoRequestModel(),
            'Token 74aba046d30c440659f486db92691fe30b9df689bd123ae9446760093ac0bbe7');

        VideoResponseModel videoResponseData =
            VideoResponseModel.fromJson(previewData.response.data);
        // Dispatch the action to update chat messages in the store
        store.dispatch(UpdateVideosResponse(videoResponse: videoResponseData));
        store.dispatch(UpdateAccestId(accestId: tpStreamId));
      } else {
        print("tpstream url null");
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
