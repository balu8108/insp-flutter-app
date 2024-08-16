import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import 'package:internet_file/internet_file.dart';

class PdfViewerFromUrl extends StatefulWidget {
  final String pdfUrl;

  const PdfViewerFromUrl({Key? key, required this.pdfUrl}) : super(key: key);

  @override
  _PdfViewerFromUrlState createState() => _PdfViewerFromUrlState();
}

class _PdfViewerFromUrlState extends State<PdfViewerFromUrl> {
  late PdfControllerPinch _pdfController;

  @override
  void initState() {
    super.initState();
    _pdfController = PdfControllerPinch(
      document: PdfDocument.openData(InternetFile.get(
          "https://insp-test-local-bucket.s3.ap-south-1.amazonaws.com/pdf1.pdf")),
    );
  }

  @override
  void dispose() {
    _pdfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 26, horizontal: 28),
        title: Row(
          children: [
            const Text("File",
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
        content: Container(
          width: 600, // Set desired width
          height: 800, // Set desired height
          child: PdfViewPinch(
            controller: _pdfController,
          ),
        ));
  }
}
