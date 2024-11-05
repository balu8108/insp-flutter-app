import 'package:flutter/material.dart';
import 'package:insp/apiservices/models/calendar/timetable_response_model.dart';
import 'package:insp/apiservices/remote_data_source.dart';
import 'package:insp/utils/extensions.dart';
import 'package:insp/utils/userDetail/getUserDetail.dart';
import 'package:insp/widget/popups/pdfviewer/pdf_timetable.dart';

class ViewTimetable extends StatefulWidget {
  const ViewTimetable({super.key});

  @override
  State<ViewTimetable> createState() => _ViewTimetableState();
}

class _ViewTimetableState extends State<ViewTimetable> {
  List<TimeTableDataModel> _pdfUrlsFuture = [];
  final ScrollController scrollController = ScrollController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final userToken = getUserToken(context); // Fetch user token from context
    _fetchTimetableData(userToken);
  }

  void _fetchTimetableData(String? userToken) async {
    if (userToken == null) throw Exception("User token is null");

    final remoteDataSource = RemoteDataSource();
    final timetableData = await remoteDataSource.getAllTimeTable(userToken);

    if (timetableData.response.statusCode == 200) {
      final TimeTableResponseDataModel tt = timetableData.data;

      setState(() {
        _pdfUrlsFuture = tt.data;
      });
    } else {
      throw Exception("Failed to load timetable data");
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isWebOrLandScape = context.isWebOrLandScape();

    return AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 26, horizontal: 28),
        insetPadding: isWebOrLandScape ? null : EdgeInsets.zero,
        title: Row(
          children: [
            const Text(
              "INSP Time Table",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
        content: SizedBox(
            width: MediaQuery.of(context).size.width - 1100 < 500
                ? 450
                : MediaQuery.of(context).size.width,
            height: 800,
            child: _pdfUrlsFuture.isNotEmpty
                ? Scrollbar(
                    controller: scrollController,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      controller: scrollController,
                      itemCount: _pdfUrlsFuture.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 800, // Set a height for each PDF viewer
                          child: PdfTimeTable(
                            pdfData: _pdfUrlsFuture[index],
                          ),
                        );
                      },
                    ),
                  )
                : const Center(
                    child: Text("There is no time table available"))));
  }
}
