import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/apiservices/models/login/login_response_model.dart';
import 'package:inspflutterfrontend/pages/common/courses/my_courses_screen.dart';
import 'package:inspflutterfrontend/pages/home/home_screen.dart';
import 'package:inspflutterfrontend/pages/student/assignment/mainpage/assignmentScreen.dart';
import 'package:inspflutterfrontend/pages/common/calender/calendar_screen.dart';
import 'package:inspflutterfrontend/pages/teacher/suggestion/suggestion_page.dart';
import 'package:inspflutterfrontend/pages/teacher/uploads/mainpage/myuploads.dart';
import 'package:inspflutterfrontend/utils/getUserDetail.dart';
import 'package:inspflutterfrontend/widget/card/model/insp_card_model.dart';
import 'package:inspflutterfrontend/pages/student/library/mainpage/library_screen.dart';
import 'package:inspflutterfrontend/widget/popups/student_suggestion.dart';

class Navbar extends StatefulWidget implements PreferredSizeWidget {
  Navbar({super.key});

  final GlobalKey<_NavbarState> _navbarKey = GlobalKey<_NavbarState>();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  LoginResponseModelResult userData =
      const LoginResponseModelResult('', '', '', '', '', '', '', '', 0, 0);

  String _selectedButton = 'Home'; // Track the selected button

  @override
  void initState() {
    super.initState();
    _loadUserData();
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
    return AppBar(
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
                    builder: (BuildContext) => StudentSuggestion());
              }),
              _buildTextButton('INSP Portal', () {
                _onButtonPressed('INSP Portal');
              }),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      // Handle profile click
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text(
                        userData.name[0].toUpperCase(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
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
                _navigateToScreen(context, SuggestionPage());
              }),
              _buildTextButton('INSP Portal', () {
                _onButtonPressed('INSP Portal');
                // Handle INSP Portal button press
              }),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      // Handle profile click
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text(
                        userData.name[0].toUpperCase(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
            ],
    );
  }

  void _onButtonPressed(String buttonText) {
    setState(() {
      _selectedButton = buttonText;
    });
  }

  void _navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  Padding _buildTextButton(String text, VoidCallback onPressed) {
    final isSelected = _selectedButton == text;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            decoration:
                isSelected ? TextDecoration.underline : TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
