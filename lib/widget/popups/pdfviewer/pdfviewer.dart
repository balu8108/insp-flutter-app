import 'package:flutter/material.dart';
import 'package:insp/apiservices/remote_data_source.dart';
import 'package:insp/utils/extensions.dart';
import 'package:insp/utils/userDetail/getUserDetail.dart';
import 'package:insp/widget/popups/pdfviewer/pdfviewcontrol.dart';

class PdfViewerFromUrl extends StatefulWidget {
  final String pdfId, type;

  const PdfViewerFromUrl({super.key, required this.pdfId, required this.type});

  @override
  _PdfViewerFromUrlState createState() => _PdfViewerFromUrlState();
}

class _PdfViewerFromUrlState extends State<PdfViewerFromUrl> {
  String pdf = "";

  void getPdfUrl() async {
    try {
      final remoteDataSource = RemoteDataSource();
      String userToken = getUserToken(context);
      final pdfData = await remoteDataSource.getDocumentUrl(
          widget.pdfId, widget.type, userToken);
      if (pdfData.data.status == true) {
        final String pdfUrl = pdfData.data.data.getUrl;
        setState(() {
          pdf = pdfUrl; // Store the fetched data
        });
      } else {
        print('Error:');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getPdfUrl();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isWebOrLandScape = context.isWebOrLandScape();
    final ScrollController scrollController = ScrollController();
    return AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        insetPadding: isWebOrLandScape ? null : EdgeInsets.zero,
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
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        content: pdf.isNotEmpty
            ? PdfViewerFromUrlPoint(
                pdfUrl: pdf,
              )
            : const Center(child: CircularProgressIndicator()));
  }
}
