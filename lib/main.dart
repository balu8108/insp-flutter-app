import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/apiservices/models/login/login_response_model.dart';
import 'package:inspflutterfrontend/pages/common/livestream/widget/chat/chat_widget_redux.dart';
import 'package:inspflutterfrontend/pages/common/livestream/widget/chat/peers_widget_redux.dart';
import 'package:inspflutterfrontend/pages/common/livestream/widget/chat/preview_data_redux.dart';
import 'package:inspflutterfrontend/pages/common/livestream/widget/chat/tpstream_redux.dart';
import 'package:inspflutterfrontend/pages/common/upcomingclasses/upcoming_class_widget_redux.dart';
import 'package:inspflutterfrontend/pages/home/home_screen.dart';
import 'package:inspflutterfrontend/pages/login/login_redux.dart';
import 'package:inspflutterfrontend/pages/login/login_screen.dart';
import 'package:inspflutterfrontend/pages/onboarding/onboarding_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:inspflutterfrontend/redux/AppState.dart';
import 'package:inspflutterfrontend/redux/app_reducer.dart';
import 'package:inspflutterfrontend/utils/userDetail/getUserDetail.dart';
import 'package:inspflutterfrontend/widget/navbar/navbar_redux.dart';
import 'package:inspflutterfrontend/widget/popups/uploadLiveclassFile/upload_liveclass_file_redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux/redux.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  // Ensure that the correct platform implementation is used for macOS
  WebViewPlatform.instance = WebKitWebViewPlatform();
  WidgetsFlutterBinding.ensureInitialized();
  final store = Store<AppState>(
    appStateReducer,
    initialState: const AppState(
        loginState: LoginAppState(),
        upcomingWidgetAppState: UpcomingWidgetAppState(),
        chatWidgetAppState: ChatWidgetAppState(),
        peersWidgetAppState: PeersWidgetAppState(),
        uploadLiveclassFileAppState: UploadLiveclassFileAppState(),
        navbarAppState: NavbarAppState(),
        tpStreamAppState: TPStreamAppState(),
        previewDataAppState: PreviewDataAppState()),
    middleware: [thunkMiddleware],
  );

  runApp(MyApp(store: store));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.store});

  final Store<AppState> store;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  LoginResponseModelResult userData =
      const LoginResponseModelResult('', '', '', '', '', '', '', '', 0, 0);

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    LoginResponseModelResult userDatas = await getUserData();
    setState(() {
      userData = userDatas; // Store the fetched data
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: widget.store,
        child: MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          home: Builder(
            builder: (context) {
              if (kIsWeb || MediaQuery.of(context).size.width >= 600) {
                return userData.token == ""
                    ? const LoginScreen()
                    : HomeScreen(userData: userData);
              } else {
                return AnimatedSplashScreen(
                  duration: 3000,
                  splash: _buildSplashWidget(),
                  splashTransition: SplashTransition.sizeTransition,
                  nextScreen: const OnboardingScreen(),
                  backgroundColor: Colors.white,
                );
              }
            },
          ),
        ));
  }

  Widget _buildSplashWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: 1),
          duration: const Duration(milliseconds: 1500),
          builder: (_, double sizeFactor, __) {
            return Transform.scale(
              scale: sizeFactor,
              child: Image.asset('assets/images/insplogo.png'),
            );
          },
        ),
      ],
    );
  }
}
