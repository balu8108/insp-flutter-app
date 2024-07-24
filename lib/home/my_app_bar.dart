import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/assignments/widgets/assignmentScreen.dart';
import 'package:inspflutterfrontend/calendar/widgets/liveclass_calendar_screen.dart';
import 'package:inspflutterfrontend/common/model/insp_card_model.dart';
import 'package:inspflutterfrontend/library/library_screen.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color.fromRGBO(232, 242, 249, 1),
      title: Padding(
        padding:
            const EdgeInsets.only(left: 50.0), // Adjust left padding for logo
        child: Image.asset('assets/images/insplogo.png', height: 35.0),
      ),
      actions: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildTextButton(context, 'Home', '/homepage', () {
              // Handle Home button press
            }),
            _buildTextButton(context, 'Calendar', '/schedule-class', () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LiveclassCalendarScreen()),
              );
            }),
            _buildTextButton(
                context, 'Assignments', '/student/assignments/PHYSICS', () {
              INSPCardModel inspCardModel = const INSPCardModel(
                  '1',
                  'Physics',
                  'In Progress',
                  'Explore the fascinating world of Physics with a collection of resources covering classical mechanics, electromagnetism, thermodynamics, and quantum mechanics. Dive into the fundamental principles that govern the physical universe.');
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        AssignmentScreen.getScreen(inspCardModel)),
              );
            }),
            _buildTextButton(context, 'Library', '/library/PHYSICS/1', () {
              INSPCardModel inspCardModel = const INSPCardModel(
                  '1',
                  'Physics',
                  'In Progress',
                  'Explore the fascinating world of Physics with a collection of resources covering classical mechanics, electromagnetism, thermodynamics, and quantum mechanics. Dive into the fundamental principles that govern the physical universe.');

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        LibraryScreen.getScreen(inspCardModel)),
              );
            }),
            _buildTextButton(context, 'Suggestion', '/feedback-student', () {
              // Handle Suggestion button press
            }),
            _buildTextButton(context, 'INSP Portal', '/insp-website', () {
              // Handle INSP Portal button press
            }),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 60, 0),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    // Handle profile click
                  },
                  child: const CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text(
                      'T',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Padding _buildTextButton(
      BuildContext context, String text, String route, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: _isActive(context, route)
                    ? FontWeight.bold
                    : FontWeight.normal,
                decoration: _isActive(context, route)
                    ? TextDecoration.underline
                    : TextDecoration.none,
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool _isActive(BuildContext context, String route) {
    final currentRoute = ModalRoute.of(context)?.settings.name ?? '';
    print('Current route: $currentRoute');
    print('Button route: $route');
    return currentRoute == route;
  }
}
