// import 'package:flutter/material.dart';

// class ViewTimetable extends StatefulWidget {
//   const ViewTimetable({super.key});

//   @override
//   State<ViewTimetable> createState() => _ViewTimetableState();
// }

// class _ViewTimetableState extends State<ViewTimetable> {
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: const Text('INSP Time Table'),
//       content: SizedBox(
//         width: 600,
//         child: Text('Content goes here...'), // Add your content here
//       ),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       actions: [
//         TextButton(
//           onPressed: () {
//             Navigator.of(context).pop(); // Close the dialog
//           },
//           child: const Text('Close'),
//         ),
//       ],
//     );
//   }
// }

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/data/hardcoded/secret_key.dart';
import 'package:inspflutterfrontend/utils/userDetail/getUserDetail.dart';

class ViewTimetable extends StatefulWidget {
  const ViewTimetable({super.key});

  @override
  State<ViewTimetable> createState() => _ViewTimetableState();
}

class _ViewTimetableState extends State<ViewTimetable> {
  bool _isLoading = true;
  String _timetableData = '';

  @override
  void initState() {
    super.initState();
    _fetchTimetableData();
  }

  Future<void> _fetchTimetableData() async {
    final dio = Dio();
    try {
      String userToken = await getUserToken();
      Response response = await dio.get(
        '${api}/generic/get-all-timetable',
        options: Options(
          headers: {
            'Authorization': userToken,
          },
        ),
      );
      if (response.statusCode == 200) {
        setState(() {
          _timetableData = response
              .data['timetable']; // Adjust according to your response structure
          _isLoading = false;
        });
      } else {
        setState(() {
          _timetableData = 'Failed to load timetable data';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _timetableData = 'Error loading timetable data';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('INSP Time Table'),
      content: SizedBox(
        width: 600,
        height: 400, // Adjust the height as needed
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Text(_timetableData), // Display timetable data here
              ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}
