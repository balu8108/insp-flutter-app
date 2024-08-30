import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/pages/common/livestream/preview/liveclass_preview.dart';

class JoinClassBtn extends StatelessWidget {
  final String status;
  final bool isTeacher;
  final String roomId;

  JoinClassBtn(
      {required this.status, required this.isTeacher, required this.roomId});

  @override
  Widget build(BuildContext context) {
    Color backColor = const Color(0xFF3C8DBC);
    Color textColor = Colors.white;
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

    String text = isTeacher
        ? classStatusText['teacher']![status] ?? ''
        : classStatusText['student']![status] ?? '';

    if (status == classStatus['ONGOING']) {
      backColor = const Color.fromARGB(255, 193, 227, 182);
      textColor = const Color.fromARGB(255, 107, 104, 112);
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
          onPressed: btnDisabled
              ? null
              : () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            LiveClassPreviewScreen(roomId: roomId)),
                  );
                },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(backColor),
            foregroundColor: MaterialStateProperty.all(textColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    8.0), // Adjust border radius as needed
              ),
            ),
            minimumSize:
                MaterialStateProperty.all(const Size(double.infinity, 48.0)),
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
