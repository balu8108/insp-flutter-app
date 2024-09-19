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
  int currentPageIndex = 1; // Add page index variable
  double _scale = 1.0; // Scale for zoom
  bool isZoom = false;

  void updateState(PDFViewerAppState pDFViewerAppState) {
    setState(() {
      this.pdfViewerAppState = pDFViewerAppState;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    final pdfBytes = await InternetFile.get(widget.pdfUrl);
    _pdfControllerWindow = PdfController(
      document: PdfDocument.openData(pdfBytes),
    );
    updateState(pdfViewerAppState.copyWith(fileUrl: widget.pdfUrl));
  }

  @override
  void dispose() {
    _pdfControllerWindow?.dispose();
    super.dispose();
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
      _scale *= 1.2; // Increase the scale by 20%
    });
  }

  void zoomOut() {
    setState(() {
      _scale /= 1.2; // Decrease the scale by 20%
    });
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
          child: _pdfControllerWindow != null
              ? Stack(children: [
                  const Text(""),
                  Positioned.fill(
                      child: Transform.scale(
                          scale: _scale, // Apply the scale here
                          child: PdfView(
                            controller: _pdfControllerWindow!,
                            physics: const NeverScrollableScrollPhysics(),
                            backgroundDecoration:
                                const BoxDecoration(color: Colors.white),
                          ))),
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
                ])
              : const Center(
                  child: CircularProgressIndicator(),
                ),
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
          Text("$currentPageIndex/${_pdfControllerWindow?.pagesCount ?? 0}"),
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
