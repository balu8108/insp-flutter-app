// This file is "main.dart"
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:insp/apiservices/models/soloclasses/soloclass_detail_response_model.dart';
import 'package:insp/apiservices/models/tpstream/video_request_model.dart';
import 'package:insp/apiservices/models/tpstream/video_response_model.dart';
import 'package:insp/apiservices/remote_data_source.dart';
import 'package:insp/data/hardcoded/secret_key.dart';
import 'package:insp/redux/AppState.dart';
import 'package:insp/utils/userDetail/getUserDetail.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux/redux.dart';
import 'package:toastification/toastification.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'soloclass_redux.freezed.dart';

@freezed
class SoloClassDetailDataAppState with _$SoloClassDetailDataAppState {
  const factory SoloClassDetailDataAppState(
          {@Default(SoloClassDetail()) SoloClassDetail soloData,
          @Default('') String accestId,
          @Default(VideoResponseModel()) VideoResponseModel videoResponse}) =
      _SoloClassDetailDataAppState;
}

class UpdateSoloClassDetailData extends SoloClassDetailDataAction {
  SoloClassDetail soloData;
  UpdateSoloClassDetailData({required this.soloData});
}

class UpdateSoloVideoResponse extends SoloClassDetailDataAction {
  VideoResponseModel videoResponse;
  UpdateSoloVideoResponse({required this.videoResponse});
}

class UpdateSoloAccestId extends SoloClassDetailDataAction {
  String accestId;
  UpdateSoloAccestId({required this.accestId});
}

sealed class SoloClassDetailDataAction {}

SoloClassDetailDataAppState soloClassDetailDataReducer(
    SoloClassDetailDataAppState state, dynamic action) {
  if (action is UpdateSoloClassDetailData) {
    return state.copyWith(soloData: action.soloData);
  }
  if (action is UpdateSoloVideoResponse) {
    return state.copyWith(videoResponse: action.videoResponse);
  } else if (action is UpdateSoloAccestId) {
    return state.copyWith(accestId: action.accestId);
  }
  return state;
}

ThunkAction<AppState> getPreviewSoloClassData(
    BuildContext context, String roomId) {
  return (Store<AppState> store) async {
    try {
      String userToken = getUserToken(context);
      final remoteDataSource = RemoteDataSource();
      final soloData =
          await remoteDataSource.getSoloClassDetail(roomId, userToken);

      SoloClassDetail previewFinalData =
          SoloClassDetail.fromJson(soloData.response.data['data']);

      if (soloData.response.statusCode == 200) {
        store.dispatch(UpdateSoloClassDetailData(soloData: previewFinalData));
        if (previewFinalData.soloClassRoomRecordings.isNotEmpty) {
          store.dispatch(getSoloVideoUrlApi(
              context, previewFinalData.soloClassRoomRecordings[0].tpStreamId));
        }
      } else {
        toastification.show(
          context: context, // optional if you use ToastificationWrapper
          type: ToastificationType.warning,
          style: ToastificationStyle.fillColored,
          autoCloseDuration: const Duration(seconds: 3),
          title: const Text('Some issue, please try again'),
          alignment: Alignment.topRight,
        );
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

ThunkAction<AppState> getSoloVideoUrlApi(
    BuildContext context, String tpStreamId) {
  return (Store<AppState> store) async {
    try {
      final remoteDataSource = RemoteDataSource();

      if (tpStreamId.isNotEmpty) {
        final previewData = await remoteDataSource.getVideoPlayUrl(
            tpStreamId, const VideoRequestModel(), tpStreamToken);

        VideoResponseModel videoResponseData =
            VideoResponseModel.fromJson(previewData.response.data);

        // Dispatch the action to update chat messages in the store
        store.dispatch(
            UpdateSoloVideoResponse(videoResponse: videoResponseData));
        store.dispatch(UpdateSoloAccestId(accestId: tpStreamId));
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

ThunkAction<AppState> setSoloTpStreamInitialData() {
  return (Store<AppState> store) async {
    store.dispatch(UpdateSoloAccestId(accestId: ''));
    store.dispatch(
        UpdateSoloVideoResponse(videoResponse: const VideoResponseModel()));
  };
}
