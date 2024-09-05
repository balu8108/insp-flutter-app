import 'package:flutter/material.dart';
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

  // call an API of get all subjects
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
        print('Error h:');
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
    if (UniversalPlatform.isWindows) {
      _pdfControllerWindow?.dispose();
    } else {
      _pdfController?.dispose();
    }
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
            "File",
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
      content: Container(
        width: 600, // Set desired width
        height: 800, // Set desired height
        child: _pdfController != null || _pdfControllerWindow != null
            ? UniversalPlatform.isWindows
                ? PdfView(controller: _pdfControllerWindow!)
                : PdfViewPinch(
                    controller: _pdfController!,
                  )
            : const Center(
                child:
                    CircularProgressIndicator()), // Show a loader until the PDF is loaded
      ),
    );
  }
}
