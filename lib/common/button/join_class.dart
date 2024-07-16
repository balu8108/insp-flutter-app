import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart'; // Assuming you're using Redux for state management

class JoinClassBtn extends StatelessWidget {
  // final bool isLoading;
  final String status;
  // final Function onClickHandler;

  JoinClassBtn({required this.status});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    // final userProfile = StoreProvider.of<AppState>(context).state.auth.userProfile; // Adjust to your actual state structure

    Color backColor = Color(0xFF3C8DBC);
    Color textColor = Colors.white;
    String text = 'Start';
    bool btnDisabled = false;

    final Map<String, Map<String, String>> classStatusText = {
      'teacher': {
        'SCHEDULED': 'Start',
        'ONGOING': 'Ongoing',
        'NOT_STARTED': 'Start',
        'FINISHED': 'View Recording',
        'NOT_CONDUCTED': 'Not Conducted',
      },
      'student': {
        'SCHEDULED': 'Join Class',
        'ONGOING': 'Ongoing',
        'NOT_STARTED': 'Not Started',
        'FINISHED': 'View Recording',
        'NOT_CONDUCTED': 'Not Conducted',
      },
    };

    const Map<String, String> classStatus = {
      'SCHEDULED': 'SCHEDULED',
      'ONGOING': 'ONGOING',
      'NOT_STARTED': 'NOT_STARTED',
      'FINISHED': 'FINISHED',
      'NOT_CONDUCTED': 'NOT_CONDUCTED',
    };

    if (true) {
      // Assuming user_type is an integer in your userProfile
      text = (1 == 1)
          ? classStatusText['teacher']![status] ??
              'Unknown' // Using null-aware operator and providing a fallback value if status is not found
          : classStatusText['student']![status] ??
              'Unknown'; // Using null-aware operator and providing a fallback value if status is not found
    }

    if (status == classStatus['ONGOING']) {
      backColor = const Color.fromARGB(255, 193, 227, 182);
      textColor = const Color.fromARGB(255, 107, 104, 112);
    } else if (status == classStatus['NOT_STARTED']) {
      if (0 == 0) {
        backColor = const Color.fromARGB(255, 255, 89, 89);
      }
    } else if (status == classStatus['FINISHED']) {
      backColor = const Color.fromARGB(255, 232, 232, 232);
      textColor = const Color.fromARGB(255, 107, 104, 112);
      btnDisabled = false;
    } else if (status == classStatus['NOT_CONDUCTED']) {
      backColor = const Color.fromARGB(255, 196, 196, 196);
      textColor = const Color.fromARGB(255, 107, 104, 112);
      btnDisabled = true;
    }

    return SizedBox(
        width: double.infinity, // Set width to 100% of the parent container
        child: ElevatedButton(
      onPressed: btnDisabled ? null : null,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(backColor),
        foregroundColor: MaterialStateProperty.all(textColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Adjust border radius as needed
          ),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14.0,
        ),
      ),
    ));
  }
}
