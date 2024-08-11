import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/pages/student/assignment/mainpage/assignmentScreen.dart';
import 'package:inspflutterfrontend/pages/common/calender/calendar_screen.dart';
import 'package:inspflutterfrontend/pages/teacher/suggestion/suggestion_page.dart';
import 'package:inspflutterfrontend/widget/card/model/insp_card_model.dart';
import 'package:inspflutterfrontend/pages/home/home_screen.dart';
import 'package:inspflutterfrontend/pages/student/library/mainpage/library_screen.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color.fromRGBO(232, 242, 249, 1),
      title: Image.asset('assets/images/insplogo.png', height: 34.0),
      actions: [
        _buildTextButton('Home', () {
          INSPCardModel inspCardModel = const INSPCardModel(
              '1',
              'Physics',
              'In Progress',
              'Explore the fascinating world of Physics with a collection of resources covering classical mechanics, electromagnetism, thermodynamics, and quantum mechanics. Dive into the fundamental principles that govern the physical universe.');
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomeScreen.getScreen(inspCardModel)),
          );
          // Handle Home button press
        }),
        _buildTextButton('Calendar', () {
          // Handle Calendar button press
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CalendarScreen()),
          );
        }),
        _buildTextButton('Assignments', () {
          // Handle Assignments button press
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
        _buildTextButton('Library', () {
          INSPCardModel inspCardModel = const INSPCardModel(
              '1',
              'Physics',
              'In Progress',
              'Explore the fascinating world of Physics with a collection of resources covering classical mechanics, electromagnetism, thermodynamics, and quantum mechanics. Dive into the fundamental principles that govern the physical universe.');
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LibraryScreen.getScreen(inspCardModel)),
          );
          // Handle Library button press
        }),
        _buildTextButton('Suggestion', () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SuggestionPage()),
          );

          // showDialog(
          //     context: context, builder: (BuildContext) => StudentSuggestion());
          // Handle Suggestion button press
        }),
        _buildTextButton('INSP Portal', () {
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
    );
  }

  Padding _buildTextButton(String text, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
    );
  }
}
