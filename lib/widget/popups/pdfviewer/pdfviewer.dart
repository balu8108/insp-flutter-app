import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/apiservices/models/login/login_response_model.dart';
import 'package:inspflutterfrontend/apiservices/remote_data_source.dart';
import 'package:inspflutterfrontend/utils/userDetail/getUserDetail.dart';
import 'package:inspflutterfrontend/widget/popups/pdfviewer/pdfviewer_redux.dart';
import 'package:pdfx/pdfx.dart';
import 'package:internet_file/internet_file.dart';
import 'package:universal_platform/universal_platform.dart';

class PdfViewerFromUrl extends StatefulWidget {
  final String pdfId, type;

  const PdfViewerFromUrl({super.key, required this.pdfId, required this.type});

  @override
  _PdfViewerFromUrlState createState() => _PdfViewerFromUrlState();
}

class _PdfViewerFromUrlState extends State<PdfViewerFromUrl> {
  PdfController? _pdfControllerWindow;
  PdfControllerPinch? _pdfController;
  PDFViewerAppState pdfViewerAppState = const PDFViewerAppState();

  void updateState(PDFViewerAppState pDFViewerAppState) {
    setState(() {
      this.pdfViewerAppState = pDFViewerAppState;
    });
  }

  // call an API to get the PDF URL
  void getPdfUrl() async {
    try {
      final remoteDataSource = RemoteDataSource();
      String userToken = await getUserToken();
      final pdfData = await remoteDataSource.getDocumentUrl(
          widget.pdfId, widget.type, userToken);
      if (pdfData.data.status == true) {
        final String pdfUrl = pdfData.data.data.getUrl;
        final pdfBytes = await InternetFile.get(pdfUrl);
        if (UniversalPlatform.isWindows) {
          _pdfControllerWindow = PdfController(
            document: PdfDocument.openData(pdfBytes),
          );
        } else {
          _pdfController = PdfControllerPinch(
            document: PdfDocument.openData(pdfBytes),
          );
        }
        updateState(pdfViewerAppState.copyWith(fileUrl: pdfUrl));
      } else {
        // Handle error response
        print('Error:');
      }
    } catch (e) {
      // Handle any other errors
      print('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    getPdfUrl();
  }

  @override
  void dispose() {
    _pdfControllerWindow?.dispose();
    _pdfController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 26, horizontal: 28),
      title: Row(
        children: [
          const Text(
            "Document Viewer",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
        ],
      ),
      content: FutureBuilder<LoginResponseModelResult>(
        future: getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading data'));
          } else {
            String userName = snapshot.data?.name ?? '';
            String userEmail = snapshot.data?.email ?? '';
            return Column(children: [
              Expanded(
                  child: Container(
                width: MediaQuery.of(context).size.width - 1100 < 500
                    ? 500
                    : MediaQuery.of(context).size.width, // Set desired width
                height: 800, // Set desired height
                child: _pdfController != null || _pdfControllerWindow != null
                    ? Stack(children: [
                        UniversalPlatform.isWindows
                            ? PdfView(controller: _pdfControllerWindow!)
                            : PdfViewPinch(controller: _pdfController!),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: Opacity(
                              opacity:
                                  0.4, // Set the transparency level of the watermark
                              child: Text(
                                '$userName - $userEmail', // Watermark text
                                style: const TextStyle(
                                  fontSize: 20, // Adjust size
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(60, 141, 188,
                                      1), // Adjust color of the watermark
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
              )),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.zoom_out),
                    onPressed: () => {}, // Custom zoom-out functionality
                  ),
                  IconButton(
                    icon: const Icon(Icons.zoom_in),
                    onPressed: () => {}, // Custom zoom-in functionality
                  ),
                ],
              ),
            ]);
          }
        },
      ),
    );
  }
}
