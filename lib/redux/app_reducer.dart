import 'package:inspflutterfrontend/pages/common/livestream/widget/chat/chat_widget_redux.dart';
import 'package:inspflutterfrontend/pages/common/upcomingclasses/upcoming_class_widget_redux.dart';
import 'package:inspflutterfrontend/pages/login/login_redux.dart';
import 'package:inspflutterfrontend/redux/AppState.dart';

AppState appStateReducer(AppState state, dynamic action) {
  return AppState(
      loginState: loginStateReducer(state.loginState, action),
      upcomingWidgetAppState:
          upcomingWidgetReducer(state.upcomingWidgetAppState, action),
      chatWidgetAppState:
          chatMessageStateReducer(state.chatWidgetAppState, action)
      // assignmentTopicState: assignmentTopicStateReducer(state.assignmentTopicState, action),
      );
}
