import 'package:flutter/material.dart';
import 'package:insp/utils/extensions.dart';
import 'package:insp/widget/inputField/picked_file.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/base/base.dart';
import 'package:insp/widget/popups/uploadClassFile/upload_class_file_redux.dart';

class UploadClassFile extends StatelessWidget {
  const UploadClassFile({super.key, required this.deleteFeedback});

  final Function() deleteFeedback;

  @override
  Widget build(BuildContext context) {
    bool isWebOrLandScape = context.isWebOrLandScape();
    void createAssignment() {
      dispatch(context, handleUploadFileClass(context, deleteFeedback));
    }

    void uploadFile() {
      dispatch(context, pickFilesforliveclass(context));
    }

    void defaultLoaderFunction() {}

    return StoreConnector<UploadClassFileAppState, UploadClassFileAppState>(
        converter: (store) => store.state,
        builder: (context, UploadClassFileAppState state) => AlertDialog(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 28),
                insetPadding: isWebOrLandScape ? null : EdgeInsets.zero,
                title: Row(
                  children: [
                    const Text("Upload File",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        )),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
                content: SizedBox(
                  height: 200,
                  width: 500, // Set your desired width here
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // File Upload Row
                        PickedFile(
                            uploadFile: uploadFile,
                            removeFile: (file) {
                              dispatch(
                                  context, RemoveLiveClassFile(filename: file));
                            },
                            pickedFilesName: state.pickedFilesName),
                      ],
                    ),
                  ),
                ),
                actions: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: isWebOrLandScape
                              ? MediaQuery.of(context).size.width * 0.20
                              : MediaQuery.of(context).size.width * 0.50,
                          child: ElevatedButton(
                              onPressed: state.isLoading
                                  ? defaultLoaderFunction
                                  : createAssignment,
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor:
                                    const Color.fromRGBO(60, 141, 188, 1),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              child: state.isLoading
                                  ? const SizedBox(
                                      width: 18,
                                      height: 18,
                                      child: Center(
                                          child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2,
                                      )))
                                  : const Text("Upload")),
                        ),
                      ])
                ]));
  }

  static getScreen(String classroomId, String type, Function() deleteFeedback) {
    return getBaseScreen<UploadClassFileAppState, UploadClassFile>(
        uploadClassFileStateReducer,
        UploadClassFileAppState(classroomId: classroomId, classtype: type),
        UploadClassFile(deleteFeedback: deleteFeedback));
  }

  static dispatch(BuildContext context, dynamic action) {
    baseDispatch<UploadClassFileAppState>(context, action);
  }
}
