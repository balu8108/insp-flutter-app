import 'dart:io';

import 'package:flutter/material.dart';
import 'package:insp/apiservices/models/calendar/timetable_response_model.dart';
import 'package:insp/apiservices/models/login/login_response_model.dart';
import 'package:insp/utils/userDetail/getUserDetail.dart';
import 'package:insp/widget/popups/deleteTimetable/delete_timetable.dart';
import 'package:insp/widget/popups/pdfviewer/pdfviewer_redux.dart';
import 'package:pdfx/pdfx.dart';
import 'package:internet_file/internet_file.dart';

class PdfTimeTable extends StatefulWidget {
  final TimeTableDataModel pdfData;

  const PdfTimeTable({super.key, required this.pdfData});

  @override
  _PdfViewerFromUrlPointState createState() => _PdfViewerFromUrlPointState();
}

class _PdfViewerFromUrlPointState extends State<PdfTimeTable> {
  PdfControllerPinch? _pdfController;
  PdfController? _pdfControllerWindow;
  PDFViewerAppState pdfViewerAppState = const PDFViewerAppState();
  int currentPageIndex = 1;
  bool isPdfLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadPdf();
  }

  Future<void> _loadPdf() async {
    try {
      final pdfBytes = await InternetFile.get(widget.pdfData.url);
      if (Platform.isWindows) {
        _pdfControllerWindow = PdfController(
          document: PdfDocument.openData(pdfBytes),
        );
      } else {
        _pdfController = PdfControllerPinch(
          document: PdfDocument.openData(pdfBytes),
        );
      }

      setState(() {
        isPdfLoaded = true;
      });
    } catch (e) {
      setState(() {
        isPdfLoaded = false;
      });
    }
  }

  void goToNextPage() {
    if (currentPageIndex < (_pdfController?.pagesCount ?? 0)) {
      setState(() {
        currentPageIndex++;
      });
      _pdfController?.jumpToPage(currentPageIndex);
    } else if (currentPageIndex < (_pdfControllerWindow?.pagesCount ?? 0)) {
      setState(() {
        currentPageIndex++;
      });
      _pdfControllerWindow?.jumpToPage(currentPageIndex);
    } else {}
  }

  void goToPreviousPage() {
    if (currentPageIndex > 1) {
      setState(() {
        currentPageIndex--;
      });
      if (Platform.isWindows) {
        _pdfControllerWindow?.jumpToPage(currentPageIndex);
      } else {
        _pdfController?.jumpToPage(currentPageIndex);
      }
    }
  }

  @override
  void dispose() {
    _pdfController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isTeacher = isTeacherLogin(context);

    LoginResponseModelResult userData = getUserDataFromStore(context);
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Tooltip(
              message: "Previous page",
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: goToPreviousPage,
              )),
          if (_pdfControllerWindow != null && Platform.isWindows)
            PdfPageNumber(
              controller: _pdfControllerWindow!,
              builder: (_, page, loadingState, pagesCount) {
                return Container(
                  alignment: Alignment.center,
                  child: Text(
                    '$currentPageIndex/${pagesCount ?? 0}',
                  ),
                );
              },
            ),
          if (_pdfController != null && !Platform.isWindows)
            PdfPageNumber(
              controller: _pdfController!,
              builder: (_, page, loadingState, pagesCount) {
                return Container(
                  alignment: Alignment.center,
                  child: Text(
                    '$currentPageIndex/${pagesCount ?? 0}',
                  ),
                );
              },
            ),
          Tooltip(
              message: "Next page",
              child: IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: goToNextPage,
              )),
          const SizedBox(
            width: 10,
          ),
          if (isTeacher)
            Tooltip(
                message: "Delete",
                child: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return DeleteTimeTablePopup(
                            timeTableId: widget.pdfData.id);
                      },
                    );
                  },
                )),
        ],
      ),
      const SizedBox(height: 10),
      Expanded(
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 1100 < 500
              ? 450
              : MediaQuery.of(context).size.width,
          height: 500,
          child: isPdfLoaded &&
                  (_pdfController != null || _pdfControllerWindow != null)
              ? Stack(
                  children: [
                    Platform.isWindows
                        ? PdfView(
                            controller: _pdfControllerWindow!,
                            scrollDirection: Axis.horizontal,
                            physics: const NeverScrollableScrollPhysics(),
                            backgroundDecoration:
                                const BoxDecoration(color: Colors.white),
                          )
                        : PdfViewPinch(
                            controller: _pdfController!,
                            scrollDirection: Axis.horizontal,
                            backgroundDecoration:
                                const BoxDecoration(color: Colors.white),
                          ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: Opacity(
                          opacity: 0.4,
                          child: Text(
                            '${userData.name} - ${userData.email}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(60, 141, 188, 1),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : const Center(child: CircularProgressIndicator()),
        ),
      ),
    ]);
  }
}
