import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspflutterfrontend/pages/common/livestream/widget/chat/chat_widget_redux.dart';
import 'package:inspflutterfrontend/pages/common/upcomingclasses/upcoming_class_widget_redux.dart';
import 'package:inspflutterfrontend/pages/login/login_redux.dart';
import 'package:inspflutterfrontend/widget/popups/uploadLiveclassFile/upload_liveclass_file_redux.dart';

part 'AppState.freezed.dart';

// Define the combined app state
@freezed
class AppState with _$AppState {
  const factory AppState(
          {required LoginAppState loginState,
          required UpcomingWidgetAppState upcomingWidgetAppState,
          required ChatWidgetAppState chatWidgetAppState,
          required UploadLiveclassFileAppState uploadLiveclassFileAppState}) =
      _AppState;
}
