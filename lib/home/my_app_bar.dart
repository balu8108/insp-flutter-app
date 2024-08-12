import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/assignments/widgets/assignmentScreen.dart';
import 'package:inspflutterfrontend/calendar/widgets/liveclass_calendar.dart';
import 'package:inspflutterfrontend/calendar/widgets/liveclass_calendar_screen.dart';
import 'package:inspflutterfrontend/common/model/insp_card_model.dart';
import 'package:inspflutterfrontend/home/home_screen.dart';
import 'package:inspflutterfrontend/library/library_screen.dart';
import 'package:inspflutterfrontend/popups/student_suggestion.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
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
        }),
        _buildTextButton('Calendar', () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LiveclassCalendarScreen()),
          );
        }),
        _buildTextButton('Assignments', () {
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
        }),
        _buildTextButton('Suggestion', () {
          showDialog(
              context: context, builder: (BuildContext) => StudentSuggestion());
        }),
        PopupMenuButton<String>(
          icon: const Center(
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text(
                'T',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem<String>(
                value: 'profile',
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const CircleAvatar(
                          radius: 40.0,
                          backgroundColor: Colors.blue,
                          child: const Text(
                            'T',
                            style: TextStyle(color: Colors.white, fontSize: 32),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Test400',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 15),
                        TextButton(
                          onPressed: () {
                            // Handle Logout
                            Navigator.pop(context); // Close the popup menu
                          },
                          child: const Text('Logout'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ];
          },
          onSelected: (String value) {
            // No action needed here since the profile is handled in PopupMenuItem
          },
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
