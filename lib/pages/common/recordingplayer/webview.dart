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
          "https://app.tpstreams.com/embed/gcma48/8tM6dCMAcxD/?access_token=fd38baab-649a-45e9-bad1-7209b4843b0f"),
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
