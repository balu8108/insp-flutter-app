import 'package:flutter/material.dart';
import 'package:insp/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/apiservices/models/login/login_response_model.dart';
import 'package:insp/pages/common/courses/my_courses_screen.dart';
import 'package:insp/pages/home/home_screen.dart';
import 'package:insp/pages/login/login_screen.dart';
import 'package:insp/pages/student/assignment/mainpage/assignmentScreen.dart';
import 'package:insp/pages/common/calender/calendar_screen.dart';
import 'package:insp/pages/teacher/suggestion/main_suggestion_page.dart';
import 'package:insp/pages/teacher/uploads/mainpage/myuploads.dart';
import 'package:insp/redux/AppState.dart';
import 'package:insp/socket/mainsocket.dart';
import 'package:insp/utils/userDetail/getUserDetail.dart';
import 'package:insp/utils/localstorage.dart';
import 'package:insp/widget/card/model/insp_card_model.dart';
import 'package:insp/pages/student/library/mainpage/library_screen.dart';
import 'package:insp/widget/navbar/navbar_redux.dart';
import 'package:insp/widget/popups/studentSuggestion/student_suggestion.dart';

class Navbar extends StatefulWidget implements PreferredSizeWidget {
  const Navbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  LoginResponseModelResult userData =
      const LoginResponseModelResult('', '', '', '', '', '', '', '', 0, 0);
  static void dispatch(BuildContext context, NavbarAppState action) {
    StoreProvider.of<AppState>(context).dispatch(action);
  }

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _loadUserData() async {
    LoginResponseModelResult userDatas = await getUserData();
    setState(() {
      userData = userDatas;
    });
  }

  INSPCardModel inspCardModel = const INSPCardModel(
      '1',
      'Physics',
      'In Progress',
      'Explore the fascinating world of Physics with a collection of resources covering classical mechanics, electromagnetism, thermodynamics, and quantum mechanics. Dive into the fundamental principles that govern the physical universe.');

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    void _onButtonPressed(String buttonText) {
      store.dispatch(UpdateSelectedButton(selectedButton: buttonText));
    }

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromRGBO(232, 242, 249, 1),
          title: Image.asset('assets/images/insplogo.png', height: 34.0),
          actions: userData.userType == 0
              ? [
                  _buildTextButton('Home', () {
                    _onButtonPressed('Home');
                    _navigateToScreen(context, HomeScreen(userData: userData));
                  }),
                  _buildTextButton('Calendar', () {
                    _onButtonPressed('Calendar');
                    _navigateToScreen(context, CalendarScreen());
                  }),
                  _buildTextButton('Assignments', () {
                    _onButtonPressed('Assignments');
                    _navigateToScreen(
                        context, AssignmentScreen.getScreen(inspCardModel));
                  }),
                  _buildTextButton('Library', () {
                    _onButtonPressed('Library');
                    _navigateToScreen(
                        context, LibraryScreen.getScreen(inspCardModel));
                  }),
                  _buildTextButton('Suggestion', () {
                    _onButtonPressed('Suggestion');
                    showDialog(
                        context: context,
                        builder: (BuildContext) =>
                            StudentSuggestion.getScreen());
                  }),
                  _buildTextButton('INSP Portal', () {
                    _onButtonPressed('INSP Portal');
                    _launchURL(Uri.parse(
                        'https://www.inspedu.in/')); // Use Uri.parse to convert string to Uri
                  }),
                  _buildUserMenu()
                ]
              : [
                  _buildTextButton('Home', () {
                    _onButtonPressed('Home');
                    _navigateToScreen(context, HomeScreen(userData: userData));
                  }),
                  _buildTextButton('Calendar', () {
                    _onButtonPressed('Calendar');
                    _navigateToScreen(context, CalendarScreen());
                  }),
                  _buildTextButton('Courses', () {
                    _onButtonPressed('Courses');
                    _navigateToScreen(
                        context, MyCoursesScreen.getScreen(inspCardModel));
                  }),
                  _buildTextButton('Uploads', () {
                    _onButtonPressed('Uploads');
                    _navigateToScreen(context, const MyUploads());
                  }),
                  _buildTextButton('Suggestion', () {
                    _onButtonPressed('Suggestion');
                    _navigateToScreen(context, MainSuggestionPage.getScreen());
                  }),
                  _buildTextButton('INSP Portal', () {
                    _onButtonPressed('INSP Portal');
                    _launchURL(Uri.parse('https://www.inspedu.in/'));
                  }),
                  _buildUserMenu()
                ],
        ));
  }

  void _navigateToScreen(BuildContext context, Widget screen) {
    leaveRoomHandler(StoreProvider.of<AppState>(context));
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainScaffold(content: screen)),
    );
  }

  Padding _buildTextButton(String text, VoidCallback onPressed) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: StoreConnector<AppState, NavbarAppState>(
          converter: (store) => store.state.navbarAppState,
          builder: (context, NavbarAppState state) => TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              foregroundColor: Colors.black,
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: state.selectedButton == text
                    ? FontWeight.bold
                    : FontWeight.normal,
                decoration: state.selectedButton == text
                    ? TextDecoration.underline
                    : TextDecoration.none,
              ),
              backgroundColor: Colors.transparent,
              overlayColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
            ),
            child: Text(text),
          ),
        ));
  }

  Widget _buildUserMenu() {
    return PopupMenuButton<String>(
      color: Colors.white,
      icon: CircleAvatar(
        backgroundColor: Colors.blue,
        child: Text(
          userData.name.isNotEmpty ? userData.name[0].toUpperCase() : '',
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      onSelected: (value) async {
        if (value == 'Logout') {
          leaveRoomHandler(StoreProvider.of<AppState>(context));
          await logoutData("insp_user_profile");
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
            (route) => false, // This removes all the previous routes
          );
        }
      },
      offset: const Offset(-50, kToolbarHeight),
      itemBuilder: (context) => [
        PopupMenuItem<String>(
          value: 'Profile',
          child: Padding(
            padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
            child: Column(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 40.0,
                    backgroundColor: Colors.blue,
                    child: Text(
                      userData.name.isNotEmpty
                          ? userData.name[0].toUpperCase()
                          : '',
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text(userData.name),
              ],
            ),
          ),
        ),
        const PopupMenuItem<String>(
          value: 'Logout',
          child: Row(
            children: [
              Icon(Icons.logout),
              SizedBox(width: 10),
              Text('Logout'),
            ],
          ),
        ),
      ],
    );
  }
}
