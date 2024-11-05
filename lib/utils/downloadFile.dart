import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:insp/utils/toaster.dart';
import 'package:path/path.dart' as path;
import 'package:toastification/toastification.dart';

Future<void> downloadPdfWithDioToDownloads(
    BuildContext context, String pdfUrl, String fileName) async {
  try {
    // Use File Picker to select the folder (it will ask the user for permission)
    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();

    if (selectedDirectory == null) {
      showToast(context, 'No directory selected.', ToastificationType.error);
      return; // User canceled the picker
    }

    // Initialize Dio
    Dio dio = Dio();

    // Save the file in the selected directory
    String savePath = path.join(selectedDirectory, fileName);

    // Download the PDF
    await dio.download(
      pdfUrl,
      savePath,
    );

    showToast(
        context, 'file downloaded successfully', ToastificationType.success);
  } catch (e) {
    print('Error downloading PDF: $e');
  }
}
