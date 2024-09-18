import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/apiservices/models/login/login_response_model.dart';
import 'package:insp/pages/common/livestream/widget/chat/chat_widget_redux.dart';
import 'package:insp/pages/common/livestream/widget/chat/peers_widget_redux.dart';
import 'package:insp/pages/common/livestream/widget/chat/preview_data_redux.dart';
import 'package:insp/pages/common/livestream/widget/chat/tpstream_redux.dart';
import 'package:insp/pages/common/upcomingclasses/upcoming_class_widget_redux.dart';
import 'package:insp/pages/home/home_screen.dart';
import 'package:insp/pages/login/login_redux.dart';
import 'package:insp/pages/login/login_screen.dart';
import 'package:insp/pages/onboarding/onboarding_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:insp/redux/AppState.dart';
import 'package:insp/redux/app_reducer.dart';
import 'package:insp/redux/userData/userdata_redux.dart';
import 'package:insp/utils/extensions.dart';
import 'package:insp/utils/userDetail/getUserDetail.dart';
import 'package:insp/widget/mobileAppbar/mobileAppbar.dart';
import 'package:insp/widget/navbar/navbar.dart';
import 'package:insp/widget/navbar/navbar_mobile.dart';
import 'package:insp/widget/navbar/navbar_redux.dart';
import 'package:insp/widget/popups/uploadLiveclassFile/upload_liveclass_file_redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux/redux.dart';
import 'package:toastification/toastification.dart';
import 'package:tpstreams_player_sdk/tpstreams_player_sdk.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  TPStreamsSDK.initialize(orgCode: "gcma48");
  // Ensure that the correct platform implementation is used for macOS
  WebViewPlatform.instance = WebKitWebViewPlatform();
  WidgetsFlutterBinding.ensureInitialized();

  final store = Store<AppState>(
    appStateReducer,
    initialState: const AppState(
        userDataAppState: UserDataAppState(),
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

  runApp(StoreProvider<AppState>(
    store: store,
    child: MyApp(store: store),
  ));

  // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
  //   if (Platform.isAndroid) {
  //     await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  //   }
  // });
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
    widget.store.dispatch(UpdateUserData(userData: userData));
  }

  // Future<void> secureScreen() async {
  //   await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  // }

  // // Function to clear secure screen flag
  // Future<void> clearSecureScreen() async {
  //   await FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
  // }

  // @override
  // void dispose() {
  //   clearSecureScreen(); // Clear the secure flag on dispose
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white, // Set AppBar background to white
            elevation: 0, // Optional: Remove shadow under AppBar
          ),
        ),
        home: Builder(
          builder: (context) {
            if (kIsWeb || MediaQuery.of(context).size.width >= 600) {
              return userData.token == ""
                  ? const LoginScreen()
                  : MainScaffold(content: HomeScreen(userData: userData));
            } else {
              return AnimatedSplashScreen(
                duration: 3000,
                splash: _buildSplashWidget(),
                splashTransition: SplashTransition.sizeTransition,
                nextScreen: userData.token == ""
                    ? const OnboardingScreen()
                    : MainScaffold(content: HomeScreen(userData: userData)),
                backgroundColor: Colors.white,
              );
            }
          },
        ),
      ),
    );
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

class MainScaffold extends StatelessWidget {
  final Widget content;

  const MainScaffold({required this.content, super.key});

  @override
  Widget build(BuildContext context) {
    bool isWebOrLandScape = context.isWebOrLandScape();
    return isWebOrLandScape
        ? Scaffold(
            appBar: const Navbar(),
            body: content,
          )
        : Scaffold(
            appBar: const Mobileappbar(),
            body: content,
            bottomNavigationBar: const NavbarMobile(),
          );
  }
}
