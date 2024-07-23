import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/calendar/widgets/liveclass_calendar.dart';
import 'package:inspflutterfrontend/home/my_app_bar.dart';
import 'package:inspflutterfrontend/main.dart';
import 'package:inspflutterfrontend/upcomingclasseswidget/upcoming_class_screen.dart';

class LiveclassCalendarScreen extends StatefulWidget {
  const LiveclassCalendarScreen({super.key});

  @override
  State<LiveclassCalendarScreen> createState() =>
      _LiveclassCalendarScreenState();
}

class _LiveclassCalendarScreenState extends State<LiveclassCalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: UpcomingClassesScreen(),
            ),
            SizedBox(width: 24), // Adds spacing between the components
            Expanded(
              flex: 7,
              child: LiveclassCalendar(),
            ),
          ],
        ),
      ),
    );
  }
}
