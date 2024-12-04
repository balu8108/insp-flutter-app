import 'dart:io';
import 'package:flutter/material.dart';
import 'package:insp/apiservices/remote_data_source.dart';
import 'package:insp/utils/downloadFile.dart';
import 'package:insp/utils/extensions.dart';
import 'package:insp/utils/userDetail/getUserDetail.dart';
import 'package:insp/apiservices/models/mycourses/all_lectures_for_course_response_model.dart';
import 'package:insp/utils/extractFileNameFromS3URL.dart';
import 'package:insp/widget/popups/pdfviewer/pdfviewer.dart';
import 'package:insp/widget/popups/pdfviewer/windowpadViewer.dart';

class FileBoxComponent extends StatelessWidget {
  final List<LiveClassRoomFile> data;
  final String type;
  final String scrollDirection;
  final bool isTeacher;
  final bool isRecordingScreen;

  const FileBoxComponent(
      {super.key,
      required this.data,
      required this.type,
      required this.scrollDirection,
      required this.isTeacher,
      required this.isRecordingScreen});

  static var httpClient = HttpClient();

  Future<void> getPdfUrl(
      BuildContext context, String fileName, String pdfId) async {
    try {
      final remoteDataSource = RemoteDataSource();
      String userToken = getUserToken(context);
      final pdfData =
          await remoteDataSource.getDocumentUrl(pdfId, type, userToken);
      if (pdfData.data.status) {
        final String pdfUrl = pdfData.data.data.getUrl;
        await downloadPdfWithDioToDownloads(context, pdfUrl, fileName);
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Widget _buildFileItem(BuildContext context, LiveClassRoomFile item) {
    String fileName = extractFileNameFromS3URL(item.key);

    return GestureDetector(
      onTap: () {
        if (isRecordingScreen) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return WindowPdfViewerFromUrl(
                  pdfId: item.id.toString(), type: type);
            },
          );
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return PdfViewerFromUrl(pdfId: item.id.toString(), type: type);
            },
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 8.0),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: Colors.white,
          border: Border.all(color: const Color.fromRGBO(149, 151, 146, 0.49)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 8,
              child: Tooltip(
                message: fileName,
                child: Text(
                  fileName,
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Color.fromRGBO(44, 51, 41, 0.47),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            if (isTeacher)
              Expanded(
                flex: 2,
                child: GestureDetector(
                  onTap: () async {
                    await getPdfUrl(context, fileName, item.id.toString());
                  },
                  child: const Icon(
                    Icons.file_download_outlined,
                    size: 20.0,
                    semanticLabel: 'Download file',
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return const Padding(
        padding: EdgeInsets.only(top: 16),
        child: Text(
          'No files or notes for this topic.',
          style: TextStyle(fontSize: 12),
        ),
      );
    }

    final isHorizontal = scrollDirection == "horizontal";
    final crossAxisCount =
        isHorizontal ? (context.isWebOrLandScape() ? 4 : 1) : 1;

    return Container(
      constraints: const BoxConstraints(maxWidth: double.infinity),
      child: GridView.builder(
        itemCount: data.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => _buildFileItem(context, data[index]),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 16,
          mainAxisSpacing: 5,
          mainAxisExtent: 50,
        ),
      ),
    );
  }
}
