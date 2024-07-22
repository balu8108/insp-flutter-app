import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/data/remote/models/mycourses/all_lectures_for_course_response_model.dart';
import 'package:inspflutterfrontend/utils/extractFileNameFromS3URL.dart';

class FileBoxComponent extends StatelessWidget {
  final List<LiveClassRoomFile> data;
  final String type, scrollDirection;
  final double maxHeight;

  FileBoxComponent(
      {required this.data,
      required this.type,
      required this.scrollDirection,
      required this.maxHeight});

  @override
  Widget build(BuildContext context) {
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
                  var item = data[index];
                  // var userProfile = StoreProvider.of<YourAppState>(context).state.auth.userProfile; // Adjust as per your Redux setup
                  // var userRoleType = checkUserType(userProfile);
                  var userRoleType = "TEACHER";

                  return GestureDetector(
                    onTap: () {
                      // Dispatch action to open modal
                      // Replace with your actual dispatch logic
                      // dispatch(setIsDocModalOpen(item?.id, item?.key, type, true));
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
                          if (item.isDownloadable || userRoleType == "TEACHER")
                            Expanded(
                                flex: 2,
                                child: GestureDetector(
                                    onTap: () {
                                      // downloadFile(item); // Adjust as per your utility function
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
