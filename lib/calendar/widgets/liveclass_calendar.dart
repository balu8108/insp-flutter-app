// import 'package:flutter/material.dart';

// class LiveclassCalendar extends StatefulWidget {
//   const LiveclassCalendar({super.key});

//   @override
//   State<LiveclassCalendar> createState() => _LiveclassCalendarState();
// }

// class _LiveclassCalendarState extends State<LiveclassCalendar> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ElevatedButton(
//             // Set the desired height
//             style: ElevatedButton.styleFrom(
//               minimumSize: Size(251, 50.0),

//               backgroundColor:
//                   const Color.fromRGBO(60, 141, 188, 1), // Background color
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(5), // Border radius
//               ),
//             ),
//             onPressed: () {
//               // Handle button press
//             },
//             child: const Text(
//               'View Time Table',
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 8),
//             child: Container(
//               color: Colors.deepPurpleAccent,
//               height: 300,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class LiveclassCalendar extends StatefulWidget {
  const LiveclassCalendar({super.key});

  @override
  State<LiveclassCalendar> createState() => _LiveclassCalendarState();
}

class _LiveclassCalendarState extends State<LiveclassCalendar> {
  late final ValueNotifier<DateTime> _selectedDay;
  late final CalendarFormat _calendarFormat;
  late final DateTime _focusedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = ValueNotifier(DateTime.now());
    _calendarFormat = CalendarFormat.month;
    _focusedDay = DateTime.now();
  }

  @override
  void dispose() {
    _selectedDay.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(251, 50.0),

                backgroundColor:
                    const Color.fromRGBO(60, 141, 188, 1), // Background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5), // Border radius
                ),
              ),
              onPressed: () {
                // Handle button press
              },
              child: const Text(
                'View Time Table',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            child: TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) {
                // Use selectedDayPredicate to determine which day is currently selected.
                // If this returns true, then `day` will be marked as selected.
                // Using `isSameDay` is recommended to disregard the time-part of `DateTime`.
                return isSameDay(_selectedDay.value, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                // Call `setState()` when updating the selected day
                if (!isSameDay(_selectedDay.value, selectedDay)) {
                  setState(() {
                    _selectedDay.value = selectedDay;
                    _focusedDay =
                        focusedDay; // update `_focusedDay` here as well
                  });
                }
              },
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  // Call `setState()` when updating calendar format
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                // No need to call `setState()` here
                _focusedDay = focusedDay;
              },
            ),
          )
        ],
      ),
    );
  }
}
