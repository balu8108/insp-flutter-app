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
        print('Error fetching PDF URL');
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
    return Center(
      child: Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height *
              0.8, // Set height to 80% of screen height
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
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
              const SizedBox(height: 10),
              Expanded(
                child: pdf.isNotEmpty
                    ? PdfViewerFromUrlPoint(
                        pdfUrl: pdf,
                      )
                    : const Center(child: CircularProgressIndicator()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
