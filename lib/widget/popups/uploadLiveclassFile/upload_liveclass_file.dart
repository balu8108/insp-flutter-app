import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/redux/AppState.dart';
import 'package:inspflutterfrontend/widget/heading/insp_heading.dart';
import 'package:inspflutterfrontend/widget/popups/uploadLiveclassFile/upload_liveclass_file_redux.dart';

class UploadFilePopup extends StatefulWidget {
  const UploadFilePopup({super.key});

  @override
  _UploadFilePopupState createState() => _UploadFilePopupState();
}

class _UploadFilePopupState extends State<UploadFilePopup> {
  static void dispatch(
      BuildContext context, UploadLiveclassFileAppState action) {
    StoreProvider.of<AppState>(context).dispatch(action);
  }

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);

    void uploadFile(List<PlatformFile> pickedFiles) {
      store.dispatch(uploadFilesToServer(context, pickedFiles));
    }

    return PopupMenuButton(
      color: Colors.white,
      icon: const Icon(Icons.add, size: 24.0),
      onSelected: (_) {},
      itemBuilder: (context) => [
        PopupMenuItem(
            enabled: false,
            child: StoreConnector<AppState, UploadLiveclassFileAppState>(
              converter: (store) => store.state.uploadLiveclassFileAppState,
              builder: (context, UploadLiveclassFileAppState state) =>
                  Container(
                width: 250, // Set the width of the popup menu
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(flex: 9, child: INSPHeading("Upload File")),
                        IconButton(
                          icon: Icon(Icons.close, size: 20),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        store.dispatch(pickFilesforliveclass(context));
                      },
                      child: AbsorbPointer(
                        absorbing: true,
                        child: TextFormField(
                          controller: TextEditingController(
                              text: state.pickedFilesName),
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText: "Files to upload",
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(58, 53, 65, 0.38),
                              fontWeight: FontWeight.w400,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(58, 53, 65, 0.38),
                                width: 1.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(58, 53, 65, 0.38),
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(58, 53, 65, 0.38),
                                width: 1.0,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                              vertical: 12.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      height: 39,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            const Color(0xFF3C8DBC),
                          ),
                          foregroundColor: MaterialStateProperty.all(
                            const Color(0xFF3C8DBC),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(vertical: 12.0),
                          ),
                        ),
                        onPressed: () {
                          uploadFile(state.pickedFiles);
                        },
                        child: const Text(
                          'Upload',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ))
      ],
    );
  }
}
