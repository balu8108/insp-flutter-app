import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/apiservices/remote_data_source.dart';
import 'package:inspflutterfrontend/utils/getUserDetail.dart';
import 'package:inspflutterfrontend/widget/popups/pdfviewer/pdfviewer_redux.dart';
import 'package:pdfx/pdfx.dart';
import 'package:internet_file/internet_file.dart';

class PdfViewerFromUrl extends StatefulWidget {
  final String pdfId;

  const PdfViewerFromUrl({super.key, required this.pdfId});

  @override
  _PdfViewerFromUrlState createState() => _PdfViewerFromUrlState();
}

class _PdfViewerFromUrlState extends State<PdfViewerFromUrl> {
  PdfControllerPinch? _pdfController;
  PDFViewerAppState pdfViewerAppState = const PDFViewerAppState();

  void updateState(PDFViewerAppState pDFViewerAppState) {
    setState(() {
      this.pdfViewerAppState = pDFViewerAppState;
    });
  }

  // call an API of get all subjects
  void getAllLatestSoloClasses() async {
    try {
      final remoteDataSource = RemoteDataSource();
      String userToken = await getUserToken();
      final pdfData = await remoteDataSource.getDocumentUrl(
          widget.pdfId, "live", userToken);
      if (pdfData.data.status == 200) {
        final String pdfUrl = pdfData.data.data.getUrl;
        final pdfBytes = await InternetFile.get(pdfUrl);
        _pdfController = PdfControllerPinch(
          document: PdfDocument.openData(pdfBytes),
        );
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
    getAllLatestSoloClasses();
  }

  @override
  void dispose() {
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
        child: _pdfController != null
            ? PdfViewPinch(
                controller: _pdfController!,
              )
            : Center(
                child:
                    CircularProgressIndicator()), // Show a loader until the PDF is loaded
      ),
    );
  }
}
