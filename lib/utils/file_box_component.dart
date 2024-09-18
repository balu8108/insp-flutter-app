import 'dart:io';
import 'package:flutter/material.dart';
import 'package:insp/apiservices/remote_data_source.dart';
import 'package:insp/utils/downloadFile.dart';
import 'package:insp/utils/userDetail/getUserDetail.dart';
import 'package:insp/apiservices/models/mycourses/all_lectures_for_course_response_model.dart';
import 'package:insp/utils/extractFileNameFromS3URL.dart';
import 'package:insp/widget/popups/pdfviewer/pdfviewer.dart';

class FileBoxComponent extends StatelessWidget {
  final List<LiveClassRoomFile> data;
  final String type, scrollDirection;
  final double maxHeight;
  final bool isTeacher;

  FileBoxComponent(
      {required this.data,
      required this.type,
      required this.scrollDirection,
      required this.maxHeight,
      required this.isTeacher});

  static var httpClient = HttpClient();

  @override
  Widget build(BuildContext context) {
    void getPdfUrl(String fileName, String pdfId) async {
      try {
        final remoteDataSource = RemoteDataSource();
        String userToken = getUserToken(context);
        final pdfData =
            await remoteDataSource.getDocumentUrl(pdfId, "live", userToken);
        if (pdfData.data.status == true) {
          final String pdfUrl = pdfData.data.data.getUrl;
          await downloadPdfWithDioToDownloads(context, pdfUrl, fileName);
        }
      } catch (e) {
        // Handle any other errors
        print('Error: $e');
      }
    }

    return Container(
        constraints:
            BoxConstraints(maxHeight: maxHeight, maxWidth: double.infinity),
        child: data.isNotEmpty
            ? ListView.separated(
                scrollDirection: scrollDirection == "horizontal"
                    ? Axis.horizontal
                    : Axis.vertical,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final LiveClassRoomFile item = data[index];

                  return GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return PdfViewerFromUrl(
                              pdfId: item.id.toString(), type: type);
                        },
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 8.0),
                      width: scrollDirection == "horizontal"
                          ? 200
                          : double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: Colors.white,
                        border: Border.all(
                            color: Color.fromRGBO(149, 151, 146, 0.49)),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex: 8,
                              child: Tooltip(
                                message: extractFileNameFromS3URL(item
                                    .key), // Adjust as per your utility function
                                child: Text(
                                  extractFileNameFromS3URL(item.key),
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                    color: Color.fromRGBO(44, 51, 41, 0.47),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              )),
                          const SizedBox(
                            width: 16,
                          ),
                          if (isTeacher)
                            Expanded(
                                flex: 2,
                                child: GestureDetector(
                                    onTap: () async {
                                      String fileName =
                                          extractFileNameFromS3URL(item.key);
                                      getPdfUrl(fileName, item.id.toString());
                                    },
                                    child: const Icon(
                                      Icons.file_download_outlined,
                                      size: 20.0,
                                      semanticLabel:
                                          'Text to announce in accessibility modes',
                                    )))
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 10,
                  );
                },
              )
            : const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  'No files or notes for this topic.',
                  style: TextStyle(fontSize: 12),
                ),
              ));
  }
}
