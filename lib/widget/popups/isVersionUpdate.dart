import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:insp/utils/extensions.dart';

class VersionControlPopup extends StatefulWidget {
  const VersionControlPopup(
      {super.key,
      required this.version,
      required this.message,
      required this.downloadurl});

  final String version, message, downloadurl;

  @override
  _VersionControlPopupState createState() => _VersionControlPopupState();
}

class _VersionControlPopupState extends State<VersionControlPopup> {
  bool isDownloading = false;
  bool isDownloadComplete = false;
  double downloadProgress = 0.0;
  String presentDirectory = '';

  void startUpdate(BuildContext context, String downloadlink) async {
    setState(() {
      isDownloading = true;
    });

    final dio = Dio();

    String dir = Directory.current.path;
    String fileName = downloadlink.split('/').last;
    setState(() {
      presentDirectory = '$dir/$fileName';
    });
    try {
      await dio.download(downloadlink, '$dir/$fileName',
          onReceiveProgress: (recievedBytes, totalBytes) {
        if (totalBytes != -1) {
          setState(() {
            downloadProgress = recievedBytes / totalBytes;
          });
        }
      });
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isDownloading = false;
        isDownloadComplete = true;
      });
    }
  }

  // Function to execute the installer and restart the app
  void installAndRestart() async {
    try {
      // Run the installer (e.g., .exe file) using Dart's Process class
      Process.run(presentDirectory, [], runInShell: true)
          .then((ProcessResult results) {
        print(results.stdout);
        print(results.stderr);
        exit(0);
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isWebOrLandScape = context.isWebOrLandScape();

    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 26, horizontal: 28),
      insetPadding: isWebOrLandScape ? null : EdgeInsets.zero,
      title: const Row(
        children: [
          Text(
            "Version Update",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
        ],
      ),
      content: SizedBox(
        height: 200,
        width: 500, // Set your desired width here
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.start, // Aligns the column to the start (top)
          crossAxisAlignment:
              CrossAxisAlignment.start, // Aligns the text to the start (left)
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.version,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.message,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            if (isDownloading)
              const Text(
                "Download Started ...",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            if (isDownloadComplete)
              const Text(
                "We need to restart application now, please click on install",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            const SizedBox(height: 10),
            if (isDownloading) LinearProgressIndicator(value: downloadProgress),
          ],
        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SizedBox(
              width: 100,
              child: ElevatedButton(
                onPressed: isDownloading
                    ? null
                    : () async {
                        if (isDownloadComplete) {
                          installAndRestart();
                        } else {
                          startUpdate(context, widget.downloadurl);
                        }
                      },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromRGBO(60, 141, 188, 1),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                child: Text(isDownloading
                    ? "Updating..."
                    : isDownloadComplete
                        ? "Install"
                        : "Ok"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
