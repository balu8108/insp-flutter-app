import 'package:flutter/material.dart';
import 'package:insp/apiservices/models/login/login_response_model.dart';
import 'package:insp/main.dart';
import 'package:insp/pages/home/home_screen.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/pages/student/assignment/mainpage/assignmentScreen.dart';
import 'package:insp/pages/common/calender/calendar_screen.dart';
import 'package:insp/pages/teacher/suggestion/main_suggestion_page.dart';
import 'package:insp/pages/teacher/uploads/mainpage/myuploads.dart';
import 'package:insp/redux/AppState.dart';
import 'package:insp/utils/userDetail/getUserDetail.dart';
import 'package:insp/widget/card/model/insp_card_model.dart';
import 'package:insp/pages/student/library/mainpage/library_screen.dart';
import 'package:insp/widget/navbar/navbar_redux.dart';
import 'package:insp/widget/popups/studentSuggestion/student_suggestion.dart';

class NavbarMobile extends StatefulWidget implements PreferredSizeWidget {
  const NavbarMobile({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<NavbarMobile> createState() => _NavbarMobileState();
}

class _NavbarMobileState extends State<NavbarMobile> {
  static void dispatch(BuildContext context, NavbarAppState action) {
    StoreProvider.of<AppState>(context).dispatch(action);
  }

  final INSPCardModel inspCardModel = const INSPCardModel(
    '1',
    'Physics',
    'In Progress',
    'Explore the fascinating world of Physics with a collection of resources covering classical mechanics, electromagnetism, thermodynamics, and quantum mechanics. Dive into the fundamental principles that govern the physical universe.',
  );

  @override
  Widget build(BuildContext context) {
    LoginResponseModelResult userData = getUserDataFromStore(context);
    void onButtonPressed(String buttonText) {
      StoreProvider.of<AppState>(context)
          .dispatch(UpdateSelectedButton(selectedButton: buttonText));
    }

    final List<Map<String, dynamic>> userTypeZeroIcons = [
      {
        'widget': HomeScreen(userData: userData),
        'icon': Icons.home,
        'name': 'Home'
      },
      {
        'widget': const CalendarScreen(),
        'icon': Icons.calendar_month,
        'name': 'Calendar'
      },
      {
        'widget': AssignmentScreen.getScreen(inspCardModel),
        'icon': Icons.school,
        'name': 'Assignments'
      },
      {
        'widget': LibraryScreen.getScreen(inspCardModel),
        'icon': Icons.library_books,
        'name': 'Library'
      },
      {'widget': null, 'icon': Icons.lightbulb, 'name': 'StudentSuggestion'}
    ];

    final List<Map<String, dynamic>> teacherTypeZeroIcons = [
      {
        'widget': HomeScreen(userData: userData),
        'icon': Icons.home_rounded,
        'name': 'Home'
      },
      {
        'widget': const CalendarScreen(),
        'icon': Icons.calendar_month,
        'name': 'Calendar'
      },
      {
        'widget': AssignmentScreen.getScreen(inspCardModel),
        'icon': Icons.library_books,
        'name': 'Library'
      },
      {
        'widget': const MyUploads(),
        'icon': Icons.assignment_add,
        'name': 'Assignments'
      },
      {
        'widget': MainSuggestionPage.getScreen(),
        'icon': Icons.lightbulb,
        'name': 'Suggestion'
      }
    ];

    bool isTeacher = isTeacherLogin(context);
    final icons = isTeacher ? teacherTypeZeroIcons : userTypeZeroIcons;

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
        child: StoreConnector<AppState, NavbarAppState>(
            converter: (store) => store.state.navbarAppState,
            builder: (context, NavbarAppState state) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: icons.map((item) {
                    return Container(
                      decoration: BoxDecoration(
                        color: state.selectedButton == item['name']
                            ? Colors.white
                            : const Color.fromRGBO(60, 141, 188, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        icon: Icon(
                          item['icon'],
                          color: state.selectedButton == item['name']
                              ? const Color.fromRGBO(60, 141, 188, 1)
                              : Colors.white,
                        ),
                        onPressed: () {
                          onButtonPressed(item['name']);

                          if (item['name'] == 'StudentSuggestion') {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  StudentSuggestion.getScreen(),
                            );
                          } else {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MainScaffold(content: item['widget']),
                              ),
                              (route) => false,
                            );
                          }
                        },
                      ),
                    );
                  }).toList(),
                )));
  }
}
