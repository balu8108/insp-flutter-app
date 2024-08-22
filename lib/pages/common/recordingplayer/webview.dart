import 'package:flutter/material.dart';
import "package:webview_universal/webview_universal.dart";

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  WebViewController webViewController = WebViewController();

  @override
  void initState() {
    super.initState();
    webViewController.init(
      context: context,
      setState: setState,
      uri: Uri.parse(
          "https://app.tpstreams.com/embed/gcma48/uZfMzhPDJEs/?access_token=e8c04c94-0eda-4464-b6fb-57f870d9a92e"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: WebView(
        controller: webViewController,
      ),
    );
  }
}
