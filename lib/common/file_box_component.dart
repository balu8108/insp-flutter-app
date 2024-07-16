import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart'; // For using Redux
import 'package:inspflutterfrontend/data/remote/models/mycourses/all_lectures_for_course_response_model.dart';
import 'package:inspflutterfrontend/utils/extractFileNameFromS3URL.dart';
import 'package:redux/redux.dart'; // For Redux store

class FileBoxComponent extends StatelessWidget {
  final List<LiveClassRoomFile> data;
  final String type;

  FileBoxComponent({required this.data, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 140.0, maxWidth: double.infinity),
      child: ListView.builder(
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
              margin: EdgeInsets.only(bottom: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                border: Border.all(color: Color.fromRGBO(149, 151, 146, 0.49)),
              ),
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Tooltip(
                    message: extractFileNameFromS3URL(
                        item.key), // Adjust as per your utility function
                    child: Text(
                      extractFileNameFromS3URL(item.key),
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Color.fromRGBO(44, 51, 41, 0.47),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  if (item.isDownloadable || userRoleType == "TEACHER")
                    GestureDetector(
                        onTap: () {
                          // downloadFile(item); // Adjust as per your utility function
                        },
                        child:Icon(
                          Icons.download_sharp,
                          size: 24.0,
                          semanticLabel: 'Text to announce in accessibility modes',
                        )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
