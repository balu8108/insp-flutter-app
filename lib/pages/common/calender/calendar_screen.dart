import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;
import 'package:inspflutterfrontend/pages/common/calender/widget/liveclass_calendar.dart';
import 'package:inspflutterfrontend/utils/extensions.dart';
import 'package:inspflutterfrontend/widget/navbar/navbar.dart';
import 'package:inspflutterfrontend/pages/common/upcomingclasses/upcoming_class_screen.dart';
import 'package:inspflutterfrontend/widget/navigationbar/navigator_mobile_bar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    final isDesktop =
        kIsWeb || Platform.isWindows || Platform.isLinux || Platform.isMacOS;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Navbar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            if (isDesktop) ...[
              const Expanded(
                flex: 3,
                child: UpcomingClassesScreen(),
              ),
              const SizedBox(width: 17),
            ],
            Expanded(
              flex: isDesktop ? 9 : 12, // Adjust flex for mobile
              child: LiveclassCalendar.getScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
