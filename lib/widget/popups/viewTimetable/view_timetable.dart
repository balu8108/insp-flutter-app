import 'package:flutter/material.dart';
import 'package:insp/apiservices/models/calendar/timetable_response_model.dart';
import 'package:insp/apiservices/remote_data_source.dart';
import 'package:insp/utils/extensions.dart';
import 'package:insp/utils/userDetail/getUserDetail.dart';
import 'package:internet_file/internet_file.dart';
import 'package:pdfx/pdfx.dart';
import 'package:universal_platform/universal_platform.dart';

class ViewTimetable extends StatefulWidget {
  const ViewTimetable({super.key});

  @override
  State<ViewTimetable> createState() => _ViewTimetableState();
}

class _ViewTimetableState extends State<ViewTimetable> {
  bool _isLoading = true;
  final List<PdfController?> _pdfControllers = [];
  final List<PdfControllerPinch?> _pdfControllersPinch = [];
  List<String> pdfUrls = [];

  @override
  void initState() {
    super.initState();
    _fetchTimetableData();
  }

  Future<void> _fetchTimetableData() async {
    try {
      String userToken = getUserToken(context);
      final remoteDataSource = RemoteDataSource();
      final timetabledata = await remoteDataSource.getAllTimeTable(userToken);

      if (timetabledata.response.statusCode == 200) {
        TimeTableResponseDataModel document = timetabledata.data;
        pdfUrls =
            document.data.map((doc) => doc.url).toList(); // Collect all URLs

        // Fetch PDF bytes and create controllers for each PDF
        for (var url in pdfUrls) {
          final pdfBytes = await InternetFile.get(url);
          if (UniversalPlatform.isWindows) {
            _pdfControllers.add(
              PdfController(document: PdfDocument.openData(pdfBytes)),
            );
          } else {
            _pdfControllersPinch.add(
              PdfControllerPinch(document: PdfDocument.openData(pdfBytes)),
            );
          }
        }

        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isWebOrLandScape = context.isWebOrLandScape();
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 26, horizontal: 28),
      insetPadding: isWebOrLandScape ? null : EdgeInsets.zero,
      title: Row(
        children: [
          const Text("INSP Time Table",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              )),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
        ],
      ),
      content: SizedBox(
        width: 600, // Set desired width
        height: 800, // Set desired height
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: pdfUrls.length,
                itemBuilder: (context, index) {
                  if (UniversalPlatform.isWindows) {
                    return _pdfControllers[index] != null
                        ? Container(
                            height: 800, // Set PDF view height
                            margin: const EdgeInsets.only(bottom: 20),
                            child: PdfView(controller: _pdfControllers[index]!),
                          )
                        : const Center(child: CircularProgressIndicator());
                  } else {
                    return _pdfControllersPinch[index] != null
                        ? Container(
                            height: 800, // Set PDF view height
                            margin: const EdgeInsets.only(bottom: 20),
                            child: PdfViewPinch(
                              controller: _pdfControllersPinch[index]!,
                            ),
                          )
                        : const Center(child: CircularProgressIndicator());
                  }
                },
              ),
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in _pdfControllers) {
      controller?.dispose();
    }
    for (var controller in _pdfControllersPinch) {
      controller?.dispose();
    }
    super.dispose();
  }
}
