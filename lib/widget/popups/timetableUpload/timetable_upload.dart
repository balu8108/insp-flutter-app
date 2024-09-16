import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:insp/data/hardcoded/secret_key.dart';
import 'package:insp/utils/userDetail/getUserDetail.dart';
import 'package:insp/widget/inputField/picked_file.dart';
import 'package:toastification/toastification.dart';

class TimetableUpload extends StatefulWidget {
  const TimetableUpload({super.key});

  @override
  _TimetableUploadState createState() => _TimetableUploadState();
}

class _TimetableUploadState extends State<TimetableUpload> {
  List<String> selectedFiles = [];
  List<String> pickedFilesName = [];
  List<PlatformFile> pickedFiles = [];

  void _chooseFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      // Use the existing instance variables instead of shadowing them
      List<PlatformFile> files = result.files;
      List<String> fileNames = files.map((item) => item.name).toList();

      setState(() {
        pickedFiles = files;
        pickedFilesName = fileNames;
      });
    } else {
      print('User canceled the picker');
    }
  }

  void _removeFile(String fileName) {
    setState(() {
      pickedFilesName =
          pickedFilesName.where((name) => name != fileName).toList();
      pickedFiles = pickedFiles.where((file) => file.name != fileName).toList();
    });
  }

  Future<void> _uploadTimetable() async {
    List<MultipartFile> files = [];
    for (PlatformFile file in pickedFiles) {
      if (kIsWeb) {
        files.add(MultipartFile.fromBytes(file.bytes!, filename: file.name));
      } else {
        files
            .add(await MultipartFile.fromFile(file.path!, filename: file.name));
      }
    }

    FormData formData = FormData.fromMap({
      'files': files,
    });
    final dio = Dio();
    try {
      String userToken = getUserToken(context);
      Response response = await dio.post(
        '${api}/generic/upload-timetable',
        data: formData,
        options: Options(
          headers: {
            'Authorization': userToken, // Include the token in the header
            'Content-Type': 'multipart/form-data',
          },
        ),
      );
      if (response.statusCode == 200) {
        toastification.show(
          context: context, // optional if you use ToastificationWrapper
          type: ToastificationType.success,
          style: ToastificationStyle.fillColored,
          autoCloseDuration: const Duration(seconds: 3),
          title: const Text('Timetable uploaded successfully'),
          alignment: Alignment.topRight,
        );
      }
      Navigator.of(context).pop();
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      title: const Text(
        'Upload Time Table',
        style: TextStyle(
            color: Color.fromRGBO(58, 53, 65, 0.87),
            fontSize: 24,
            fontWeight: FontWeight.w500),
      ),
      content: SizedBox(
        width: 550,
        height: 200,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PickedFile(
                uploadFile: _chooseFile,
                removeFile: (file) {
                  _removeFile(file);
                },
                pickedFilesName: pickedFilesName),
          ],
        ),
      ),
      actions: <Widget>[
        Center(
          child: SizedBox(
            width: 200,
            height: 47,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFF3C8DBC),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const Text(
                'Upload',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              onPressed: () {
                _uploadTimetable();
              },
            ),
          ),
        ),
      ],
    );
  }
}
