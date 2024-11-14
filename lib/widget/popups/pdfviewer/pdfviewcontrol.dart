import 'package:flutter/material.dart';
import 'package:insp/apiservices/models/login/login_response_model.dart';
import 'package:insp/utils/userDetail/getUserDetail.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerFromUrlPoint extends StatefulWidget {
  final String pdfUrl;

  const PdfViewerFromUrlPoint({super.key, required this.pdfUrl});

  @override
  _PdfViewerFromUrlPointState createState() => _PdfViewerFromUrlPointState();
}

class _PdfViewerFromUrlPointState extends State<PdfViewerFromUrlPoint> {
  final PdfViewerController _pdfViewerController = PdfViewerController();
  int _currentPageNumber = 1;
  int _totalPages = 0;

  void _zoomIn() {
    _pdfViewerController.zoomLevel += 0.25;
  }

  void _zoomOut() {
    _pdfViewerController.zoomLevel -= 0.25;
  }

  @override
  Widget build(BuildContext context) {
    LoginResponseModelResult userData = getUserDataFromStore(context);
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.zoom_in),
            onPressed: _zoomIn,
          ),
          IconButton(
            icon: const Icon(Icons.zoom_out),
            onPressed: _zoomOut,
          ),
        ],
      ),
      const SizedBox(height: 10),
      Expanded(
        child: SizedBox(
            width: MediaQuery.of(context).size.width - 1100 < 500
                ? 450
                : MediaQuery.of(context).size.width,
            height: 500,
            child: Stack(
              children: [
                SfPdfViewer.network(
                  widget.pdfUrl,
                  controller: _pdfViewerController,
                  onDocumentLoaded: (PdfDocumentLoadedDetails details) {
                    setState(() {
                      _totalPages = details.document.pages.count;
                    });
                  },
                  onPageChanged: (PdfPageChangedDetails details) {
                    setState(() {
                      _currentPageNumber = details.newPageNumber;
                    });
                  },
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
            )),
      ),
    ]);
  }
}
