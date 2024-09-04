import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/pages/common/calender/widget/liveclass_calendar.dart';
import 'package:inspflutterfrontend/utils/extensions.dart';
import 'package:inspflutterfrontend/widget/navbar/navbar.dart';
import 'package:inspflutterfrontend/pages/common/upcomingclasses/upcoming_class_screen.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    bool isWebOrLandScape = context.isWebOrLandScape();
    return Scaffold(
        appBar: Navbar(),
        body: Container(
          padding: isWebOrLandScape
              ? const EdgeInsets.all(10.0)
              : const EdgeInsets.all(0.0),
          color: Colors.white,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  flex: 3,
                  child: UpcomingClassesScreen(),
                ),
                const SizedBox(
                    width: 17), // Adds spacing between the components
                Expanded(
                  flex: 9,
                  child: LiveclassCalendar.getScreen(),
                ),
              ],
            ),
          ),
        ));
  }
}
