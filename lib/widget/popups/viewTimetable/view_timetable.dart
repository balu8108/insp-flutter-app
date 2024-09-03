import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/data/hardcoded/secret_key.dart';
import 'package:inspflutterfrontend/utils/userDetail/getUserDetail.dart';
import 'package:inspflutterfrontend/widget/popups/pdfviewer/pdfviewer_redux.dart';
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
  PdfController? _pdfControllerWindow;
  PdfControllerPinch? _pdfController;
  PDFViewerAppState pdfViewerAppState = const PDFViewerAppState();

  void updateState(PDFViewerAppState pDFViewerAppState) {
    setState(() {
      this.pdfViewerAppState = pDFViewerAppState;
    });
  }

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
        var document = response.data[0];
        final pdfBytes = await InternetFile.get(document["url"]);
        if (UniversalPlatform.isWindows) {
          _pdfControllerWindow = PdfController(
            document: PdfDocument.openData(pdfBytes),
          );
        } else {
          _pdfController = PdfControllerPinch(
            document: PdfDocument.openData(pdfBytes),
          );
        }

        updateState(pdfViewerAppState.copyWith(fileUrl: document["url"]));
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
    return AlertDialog(
      title: const Text('INSP Time Table'),
      content: SizedBox(
        width: 600,
        height: 400,
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: _pdfController != null || _pdfControllerWindow != null
                    ? UniversalPlatform.isWindows
                        ? PdfView(controller: _pdfControllerWindow!)
                        : PdfViewPinch(
                            controller: _pdfController!,
                          )
                    : Center(child: CircularProgressIndicator()),
              ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}
