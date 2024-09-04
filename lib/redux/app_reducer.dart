import 'package:inspflutterfrontend/pages/common/livestream/widget/chat/chat_widget_redux.dart';
import 'package:inspflutterfrontend/pages/common/livestream/widget/chat/peers_widget_redux.dart';
import 'package:inspflutterfrontend/pages/common/livestream/widget/chat/preview_data_redux.dart';
import 'package:inspflutterfrontend/pages/common/livestream/widget/chat/tpstream_redux.dart';
import 'package:inspflutterfrontend/pages/common/upcomingclasses/upcoming_class_widget_redux.dart';
import 'package:inspflutterfrontend/pages/login/login_redux.dart';
import 'package:inspflutterfrontend/redux/AppState.dart';
import 'package:inspflutterfrontend/widget/navbar/navbar_redux.dart';
import 'package:inspflutterfrontend/widget/popups/uploadLiveclassFile/upload_liveclass_file_redux.dart';

AppState appStateReducer(AppState state, dynamic action) {
  return AppState(
      loginState: loginStateReducer(state.loginState, action),
      upcomingWidgetAppState:
          upcomingWidgetReducer(state.upcomingWidgetAppState, action),
      chatWidgetAppState:
          chatMessageStateReducer(state.chatWidgetAppState, action),
      peersWidgetAppState:
          peersMessageStateReducer(state.peersWidgetAppState, action),
      uploadLiveclassFileAppState: uploadLiveclassFileStateReducer(
          state.uploadLiveclassFileAppState, action),
      navbarAppState: navbarStateReducer(state.navbarAppState, action),
      tpStreamAppState: tpStreamStateReducer(state.tpStreamAppState, action),
      previewDataAppState:
          previewDataReducer(state.previewDataAppState, action));
}
