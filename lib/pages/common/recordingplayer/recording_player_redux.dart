// This file is "main.dart"
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:insp/apiservices/models/login/login_response_model.dart';
import 'package:insp/apiservices/models/recording/view_recording_response_model.dart';
import 'package:insp/apiservices/models/recording/view_solo_recording_response_model.dart';
import 'package:insp/apiservices/models/tpstream/video_request_model.dart';
import 'package:insp/apiservices/models/tpstream/video_response_model.dart';
import 'package:insp/apiservices/remote_data_source.dart';
import 'package:insp/data/hardcoded/secret_key.dart';
import 'package:insp/main.dart';
import 'package:insp/pages/home/home_screen.dart';
import 'package:insp/pages/teacher/soloclassrecording/redux/soloclass_redux.dart';
import 'package:insp/redux/AppState.dart';
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
          {@Default(RecordVideoResponseModelData())
          RecordVideoResponseModelData recordedVideoData,
          @Default(RecordSoloVideoResponseModelData())
          RecordSoloVideoResponseModelData soloRecordedVideoData,
          @Default(RecordingPlayerCard('', '', '', [], [], ''))
          RecordingPlayerCard selectedItem,
          @Default('') String accestId,
          @Default(false) bool isDeleted,
          @Default(VideoResponseModel()) VideoResponseModel videoResponse}) =
      _RecordingPlayerAppState;
}

class UpdateRecordVideoData extends RecordingPlayerAction {
  RecordVideoResponseModelData recordedVideoData;
  UpdateRecordVideoData({required this.recordedVideoData});
}

class UpdateSoloRecordVideoData extends RecordingPlayerAction {
  RecordSoloVideoResponseModelData soloRecordedVideoData;
  UpdateSoloRecordVideoData({required this.soloRecordedVideoData});
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

class UpdateIsDeleted extends RecordingPlayerAction {
  bool isDeleted;
  UpdateIsDeleted({required this.isDeleted});
}

sealed class RecordingPlayerAction {}

RecordingPlayerAppState recordingPlayerReducer(
    RecordingPlayerAppState state, dynamic action) {
  if (action is UpdateSelectedItem) {
    return state.copyWith(selectedItem: action.selectedItem);
  } else if (action is UpdateRecordVideoData) {
    return state.copyWith(recordedVideoData: action.recordedVideoData);
  } else if (action is UpdateSoloRecordVideoData) {
    return state.copyWith(soloRecordedVideoData: action.soloRecordedVideoData);
  } else if (action is UpdateVideosResponse) {
    return state.copyWith(videoResponse: action.videoResponse);
  } else if (action is UpdateAccestId) {
    return state.copyWith(accestId: action.accestId);
  } else if (action is UpdateIsDeleted) {
    return state.copyWith(isDeleted: action.isDeleted);
  }
  return state;
}

ThunkAction<AppState> getLiveRecordedVideoData(
    BuildContext context, String classId) {
  return (Store<AppState> store) async {
    try {
      final remoteDataSource = RemoteDataSource();
      if (classId.isNotEmpty) {
        String userToken = getUserToken(context);
        final previewData =
            await remoteDataSource.getRecordingData(classId, userToken);

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

ThunkAction<AppState> getSoloRecordedVideoData(
    BuildContext context, String classId) {
  return (Store<AppState> store) async {
    try {
      final remoteDataSource = RemoteDataSource();
      if (classId.isNotEmpty) {
        String userToken = getUserToken(context);
        final previewData =
            await remoteDataSource.getSoloRecordingData(classId, userToken);

        if (previewData.response.statusCode == 200) {
          ViewSoloRecordingResponseModel recordedVideoDatas =
              ViewSoloRecordingResponseModel.fromJson(
                  previewData.response.data);
          store.dispatch(UpdateSoloRecordVideoData(
              soloRecordedVideoData: recordedVideoDatas.data));

          store.dispatch(getRecordedVideoUrlApi(context,
              recordedVideoDatas.data.soloClassRoomRecordings[0].tpStreamId));
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

ThunkAction<AppState> getRecordedVideoUrlApi(
    BuildContext context, String tpStreamId) {
  return (Store<AppState> store) async {
    try {
      final remoteDataSource = RemoteDataSource();
      // Validate the data before making the API call
      if (tpStreamId.isNotEmpty) {
        final previewData = await remoteDataSource.getVideoPlayUrl(
            tpStreamId, const VideoRequestModel(), tpStreamToken);
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

ThunkAction<AppState> stopSoloClassLecture(BuildContext context) {
  return (Store<AppState> store) async {
    try {
      store.dispatch(UpdateIsDeleted(isDeleted: true));
      final remoteDataSource = RemoteDataSource();
      // Validate the data before making the API call
      String userToken = getUserToken(context);

      // Fetch the tpStreamId from Redux state
      String tpStreamId = store.state.soloClassDetailDataAppState.soloData
              .soloClassRoomRecordings.isNotEmpty
          ? store.state.soloClassDetailDataAppState.soloData
              .soloClassRoomRecordings[0].tpStreamId
          : '';

      // Check if the tpStreamId is valid
      if (tpStreamId.isNotEmpty) {
        // Call the API to stop the recording
        final previewData = await remoteDataSource.stopSoloClassRecording(
            tpStreamId, userToken);

        // Check for a successful response
        if (previewData.response.statusCode == 200) {
          store.dispatch(UpdateIsDeleted(isDeleted: false));
          // Dispatch Redux action to reset the recorded video data
          store.dispatch(setSoloTpStreamInitialData());
          store.dispatch(setRecordingTpStreamInitialData());
          // Call refresh function to update the UI or navigate
          LoginResponseModelResult userDatas = await getUserData();
          // Close the current dialog first and then navigate to the home screen.
          // Use Future.delayed to ensure the widget tree has stabilized after popping the dialog
          navigatorKey.currentState?.push(
            MaterialPageRoute(
                builder: (context) =>
                    MainScaffold(content: HomeScreen(userData: userDatas))),
          );
          // Show success notification
          toastification.show(
            context: context, // optional if you use ToastificationWrapper
            type: ToastificationType.success,
            style: ToastificationStyle.fillColored,
            autoCloseDuration: const Duration(seconds: 3),
            title: const Text('Solo class ended'),
            alignment: Alignment.topRight,
          );
        } else {
          store.dispatch(UpdateIsDeleted(isDeleted: false));
          Navigator.of(context).pop();
          // Handle non-200 response, maybe show an error toast
          toastification.show(
            context: context,
            type: ToastificationType.error,
            style: ToastificationStyle.fillColored,
            autoCloseDuration: const Duration(seconds: 3),
            title: const Text('Failed to stop solo class recording'),
            alignment: Alignment.topRight,
          );
        }
      } else {
        store.dispatch(UpdateIsDeleted(isDeleted: false));
        Navigator.of(context).pop();
        toastification.show(
          context: context,
          type: ToastificationType.error,
          style: ToastificationStyle.fillColored,
          autoCloseDuration: const Duration(seconds: 3),
          title: const Text('No recording found to stop'),
          alignment: Alignment.topRight,
        );
      }
    } catch (error) {
      store.dispatch(UpdateIsDeleted(isDeleted: false));

      // Show error notification
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

ThunkAction<AppState> setRecordingTpStreamInitialData() {
  return (Store<AppState> store) async {
    store.dispatch(UpdateAccestId(accestId: ''));
    store.dispatch(UpdateRecordVideoData(
        recordedVideoData: const RecordVideoResponseModelData()));
    store.dispatch(UpdateSoloRecordVideoData(
        soloRecordedVideoData: const RecordSoloVideoResponseModelData()));
    store.dispatch(UpdateSelectedItem(
        selectedItem: const RecordingPlayerCard('', '', '', [], [], '')));
    store.dispatch(
        UpdateVideosResponse(videoResponse: const VideoResponseModel()));
  };
}
