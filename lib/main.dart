import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/apiservices/models/login/login_response_model.dart';
import 'package:inspflutterfrontend/pages/common/calender/calendar_screen.dart';
import 'package:inspflutterfrontend/pages/common/livestream/widget/chat/chat_widget_redux.dart';
import 'package:inspflutterfrontend/pages/common/livestream/widget/chat/peers_widget_redux.dart';
import 'package:inspflutterfrontend/pages/common/livestream/widget/chat/preview_data_redux.dart';
import 'package:inspflutterfrontend/pages/common/livestream/widget/chat/tpstream_redux.dart';
import 'package:inspflutterfrontend/pages/common/upcomingclasses/upcoming_class_widget_redux.dart';
import 'package:inspflutterfrontend/pages/home/home_screen.dart';
import 'package:inspflutterfrontend/pages/home/mobile_home_screen.dart';
import 'package:inspflutterfrontend/pages/home/student_home_screen.dart';
import 'package:inspflutterfrontend/pages/login/login_redux.dart';
import 'package:inspflutterfrontend/pages/login/login_screen.dart';
import 'package:inspflutterfrontend/pages/onboarding/onboarding_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:inspflutterfrontend/pages/student/assignment/mainpage/assignmentScreen.dart';
import 'package:inspflutterfrontend/pages/student/library/mainpage/library_screen.dart';
import 'package:inspflutterfrontend/redux/AppState.dart';
import 'package:inspflutterfrontend/redux/app_reducer.dart';
import 'package:inspflutterfrontend/utils/userDetail/getUserDetail.dart';
import 'package:inspflutterfrontend/widget/card/model/insp_card_model.dart';
import 'package:inspflutterfrontend/widget/mobileAppbar/mobileAppbar.dart';
import 'package:inspflutterfrontend/widget/navbar/navbar_redux.dart';
import 'package:inspflutterfrontend/widget/popups/uploadLiveclassFile/upload_liveclass_file_redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux/redux.dart';
import 'package:toastification/toastification.dart';
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
        child: ToastificationWrapper(
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
                    : HomeScreen(userData: userData);
              } else {
                return AnimatedSplashScreen(
                  duration: 3000,
                  splash: _buildSplashWidget(),
                  splashTransition: SplashTransition.sizeTransition,
                  nextScreen: userData.token == ""
                      ? const OnboardingScreen()
                      : MainScaffold(
                          content: MobileHomeScreen(userData: userData)),
                  backgroundColor: Colors.white,
                );
              }
            },
          ),
        )));
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

  const MainScaffold({required this.content, Key? key}) : super(key: key);

  // Navbar UI with dynamic icons based on user type
  Widget _navbar(BuildContext context) {
    final INSPCardModel inspCardModel = INSPCardModel(
      '1',
      'Physics',
      'In Progress',
      'Explore the fascinating world of Physics with a collection of resources covering classical mechanics, electromagnetism, thermodynamics, and quantum mechanics. Dive into the fundamental principles that govern the physical universe.',
    );

    // Define sets of widgets based on user type (in this case, userTypeZero)
    final List<Map<String, dynamic>> userTypeZeroIcons = [
      {
        'widget': StudentHomeScreen(),
        'icon': Icons.home,
      },
      {
        'widget': const CalendarScreen(),
        'icon': Icons.calendar_month,
      },
      {
        'widget': AssignmentScreen.getScreen(inspCardModel),
        'icon': Icons.school,
      },
      {
        'widget': LibraryScreen.getScreen(inspCardModel),
        'icon': Icons.library_books,
      },
      {
        'widget': StudentHomeScreen(),
        'icon': Icons.book,
      }
    ];

    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(60, 141, 188, 1),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            blurRadius: 20,
            spreadRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: userTypeZeroIcons.map((item) {
          return IconButton(
            icon: Icon(
              item['icon'],
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MainScaffold(content: item['widget']),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Mobileappbar(),
      body: content,
      bottomNavigationBar: _navbar(context),
    );
  }
}
