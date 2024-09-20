import 'package:flutter/material.dart';
import 'package:insp/apiservices/models/login/login_response_model.dart';
import 'package:insp/utils/userDetail/getUserDetail.dart';
import 'package:insp/widget/popups/pdfviewer/pdfviewer_redux.dart';
import 'package:pdfx/pdfx.dart';
import 'package:internet_file/internet_file.dart';

class PdfViewerFromUrlPoint extends StatefulWidget {
  final String pdfUrl;

  const PdfViewerFromUrlPoint({super.key, required this.pdfUrl});

  @override
  _PdfViewerFromUrlPointState createState() => _PdfViewerFromUrlPointState();
}

class _PdfViewerFromUrlPointState extends State<PdfViewerFromUrlPoint> {
  PdfController? _pdfControllerWindow;
  PDFViewerAppState pdfViewerAppState = const PDFViewerAppState();
  int currentPageIndex = 1;
  double _scale = 1.0;
  bool isPdfLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadPdf();
  }

  Future<void> _loadPdf() async {
    try {
      final pdfBytes = await InternetFile.get(widget.pdfUrl);
      _pdfControllerWindow = PdfController(
        document: PdfDocument.openData(pdfBytes),
      );
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
    if (currentPageIndex < (_pdfControllerWindow?.pagesCount ?? 0)) {
      setState(() {
        currentPageIndex++;
      });
      _pdfControllerWindow?.jumpToPage(currentPageIndex);
    }
  }

  void goToPreviousPage() {
    if (currentPageIndex > 1) {
      setState(() {
        currentPageIndex--;
      });
      _pdfControllerWindow?.jumpToPage(currentPageIndex);
    }
  }

  void zoomIn() {
    setState(() {
      _scale *= 1.2;
    });
  }

  void zoomOut() {
    setState(() {
      _scale /= 1.2;
    });
  }

  @override
  void dispose() {
    _pdfControllerWindow?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LoginResponseModelResult userData = getUserDataFromStore(context);
    return Column(children: [
      Expanded(
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 1100 < 500
              ? 450
              : MediaQuery.of(context).size.width,
          height: 800,
          child: isPdfLoaded && _pdfControllerWindow != null
              ? Stack(
                  children: [
                    Positioned.fill(
                      child: Transform.scale(
                        scale: _scale,
                        child: PdfView(
                          controller: _pdfControllerWindow!,
                          physics: const NeverScrollableScrollPhysics(),
                          backgroundDecoration:
                              const BoxDecoration(color: Colors.white),
                        ),
                      ),
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
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: goToPreviousPage,
          ),
          if (_pdfControllerWindow != null)
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
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: goToNextPage,
          ),
          IconButton(
            icon: const Icon(Icons.zoom_out),
            onPressed: zoomOut,
          ),
          IconButton(
            icon: const Icon(Icons.zoom_in),
            onPressed: zoomIn,
          ),
        ],
      ),
    ]);
  }
}
