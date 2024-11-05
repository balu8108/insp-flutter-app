import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/apiservices/models/login/login_response_model.dart';
import 'package:insp/pages/common/livestream/widget/chat/chat_widget_redux.dart';
import 'package:insp/pages/common/livestream/widget/chat/peers_widget_redux.dart';
import 'package:insp/pages/common/livestream/widget/chat/poll_timer_redux.dart';
import 'package:insp/pages/common/livestream/widget/chat/preview_data_redux.dart';
import 'package:insp/pages/common/livestream/widget/chat/tpstream_redux.dart';
import 'package:insp/pages/common/recordingplayer/recording_player_redux.dart';
import 'package:insp/pages/common/upcomingclasses/upcoming_class_widget_redux.dart';
import 'package:insp/pages/home/home_screen.dart';
import 'package:insp/pages/login/login_redux.dart';
import 'package:insp/pages/login/login_screen.dart';
import 'package:insp/pages/onboarding/onboarding_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:insp/pages/teacher/soloclassrecording/redux/soloclass_redux.dart';
import 'package:insp/redux/AppState.dart';
import 'package:insp/redux/app_reducer.dart';
import 'package:insp/redux/userData/userdata_redux.dart';
import 'package:insp/socket/mainsocket.dart';
import 'package:insp/utils/extensions.dart';
import 'package:insp/utils/userDetail/getUserDetail.dart';
import 'package:insp/widget/mobileAppbar/mobileAppbar.dart';
import 'package:insp/widget/navbar/navbar.dart';
import 'package:insp/widget/navbar/navbar_mobile.dart';
import 'package:insp/widget/navbar/navbar_redux.dart';
import 'package:insp/widget/popups/isAdbEnabled.dart';
import 'package:insp/widget/popups/uploadLiveclassFile/upload_liveclass_file_redux.dart';
// import 'package:onetaplogin/onetaplogin.dart';
// import 'package:onetaplogin/risk_monitoring_callback.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux/redux.dart';
import 'package:toastification/toastification.dart';
import 'package:tpstreams_player_sdk/tpstreams_player_sdk.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  // Ensure that the correct platform implementation is used for macOS
  WebViewPlatform.instance = WebKitWebViewPlatform();

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

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
        previewDataAppState: PreviewDataAppState(),
        recordingPlayerAppState: RecordingPlayerAppState(),
        pollTimerAppState: PollTimerAppState(),
        soloClassDetailDataAppState: SoloClassDetailDataAppState()),
    middleware: [thunkMiddleware],
  );

  TPStreamsSDK.initialize(orgCode: "gcma48");
  runApp(StoreProvider<AppState>(
    store: store,
    child: MaterialApp(home: MyApp(store: store)),
  ));
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
    try {
      // Onetaplogin.initDeviceIntelligence('clientId', 'txnId');
      // final riskMonitoringCallback = RiskMonitoringCallback(
      //   onDeveloperModeStatusChanged: (bool status) {
      //     if (status) {
      //       _showDialog(const ADBEnablePopup(
      //           message: 'Please turn off developer mode to continue'),);
      //     }
      //
      //     //print('onDeveloperModeStatusChanged enabled status changed: $status');
      //   },
      //   onADBEnabledStatusChanged: (bool status) {
      //     if (status) {
      //       _showDialog(const ADBEnablePopup(
      //           message: 'Please turn off developer mode to continue'),);
      //     }
      //     //print('ADB enabled status changed: $status');
      //   },
      //   onDeviceRootedOrJailBroken: () {
      //     _showDialog(
      //       const ADBEnablePopup(message: 'Device is rooted or jailbroken!'),);
      //     //print('Device has been rooted!');
      //   },
      //   onBootLoaderUnlocked: () {
      //     _showDialog(
      //       const ADBEnablePopup(message: 'Bootloader is unlocked!'),);
      //     //print('Bootloader has been unlocked!');
      //   },
      //   onMockGpsStatusChanged: (bool status) {
      //     if (status) {
      //       _showDialog(const ADBEnablePopup(
      //           message: 'Please turn off mock GPS to continue'),);
      //     }
      //     //print('Mock GPS status changed: $status');
      //   },
      //   onPackageDebuggable: () {
      //     _showDialog(const ADBEnablePopup(message: 'Package is debuggable!'),);
      //     //print('Package is debuggable!');
      //   },
      //   onAppCloningDetected: () {
      //     _showDialog(const ADBEnablePopup(message: 'App cloning detected !'),);
      //     //print('App cloning detected!');
      //   },
      //   onVPNStatusChanged: (bool status) {
      //     if (status) {
      //       _showDialog(const ADBEnablePopup(
      //           message: 'Please turn off vpn to continue'),);
      //     }
      //     //print('VPN status changed: $status');
      //   },
      //   onDebuggerStatusChanged: (bool status) {
      //     if (status) {
      //       _showDialog(const ADBEnablePopup(
      //           message: 'Please turn off debugger to continue'),);
      //     }
      //     //print('Debugger status changed: $status');
      //   },
      //   onHookingStatusChanged: (bool status) {
      //     if (status) {
      //       _showDialog(const ADBEnablePopup(
      //           message: 'Please turn off hooking to continue'),);
      //     }
      //     //print('Hooking status changed: $status');
      //   },
      // );
      //
      // Onetaplogin.enableRiskMonitoring(riskMonitoringCallback);
    } catch (_) {

    }
  }

  void _showDialog(Widget dialog) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => dialog,
    );
  }

  Future<void> _loadUserData() async {
    LoginResponseModelResult userDatas = await getUserData();
    setState(() {
      userData = userDatas; // Store the fetched data
    });
    widget.store.dispatch(UpdateUserData(userData: userData));
  }

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
    Future<bool> onBackPressed() async {
      leaveRoomHandler(StoreProvider.of<AppState>(context));
      return true; // Return true to allow the back navigation
    }

    return isWebOrLandScape
        ? Scaffold(
            appBar: const Navbar(),
            body: content,
          )
        : WillPopScope(
            onWillPop: onBackPressed,
            child: Scaffold(
              appBar: const Mobileappbar(),
              body: content,
              bottomNavigationBar: const NavbarMobile(),
            ));
  }
}

void pushWithoutAnimation(BuildContext context, Widget screen) {
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          MainScaffold(content: screen),
      transitionDuration: Duration.zero, // No transition duration
      reverseTransitionDuration: Duration.zero, // No reverse transition
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child; // Directly return the child without any animation
      },
    ),
  );
}

void pushAndRemoveUntilWithoutAnimation(BuildContext context, Widget screen) {
  Navigator.pushAndRemoveUntil(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionDuration: Duration.zero, // No transition duration
      reverseTransitionDuration: Duration.zero, // No reverse transition
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child; // Directly return the child without any animation
      },
    ),
    (route) => false, // Remove all previous routes
  );
}
