import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspflutterfrontend/pages/common/livestream/widget/chat/chat_widget_redux.dart';
import 'package:inspflutterfrontend/pages/common/livestream/widget/chat/peers_widget_redux.dart';
import 'package:inspflutterfrontend/pages/common/livestream/widget/chat/preview_data_redux.dart';
import 'package:inspflutterfrontend/pages/common/livestream/widget/chat/tpstream_redux.dart';
import 'package:inspflutterfrontend/pages/common/upcomingclasses/upcoming_class_widget_redux.dart';
import 'package:inspflutterfrontend/pages/login/login_redux.dart';
import 'package:inspflutterfrontend/redux/userData/userdata_redux.dart';
import 'package:inspflutterfrontend/widget/navbar/navbar_redux.dart';
import 'package:inspflutterfrontend/widget/popups/uploadLiveclassFile/upload_liveclass_file_redux.dart';

part 'AppState.freezed.dart';

// Define the combined app state
@freezed
class AppState with _$AppState {
  const factory AppState(
      {required UserDataAppState userDataAppState,
      required LoginAppState loginState,
      required UpcomingWidgetAppState upcomingWidgetAppState,
      required ChatWidgetAppState chatWidgetAppState,
      required PeersWidgetAppState peersWidgetAppState,
      required UploadLiveclassFileAppState uploadLiveclassFileAppState,
      required NavbarAppState navbarAppState,
      required TPStreamAppState tpStreamAppState,
      required PreviewDataAppState previewDataAppState}) = _AppState;
}
