import 'package:flutter/material.dart';
import "package:webview_universal/webview_universal.dart";

class WebviewUniversal extends StatefulWidget {
  @override
  _WebviewUniversalState createState() => _WebviewUniversalState();
}

class _WebviewUniversalState extends State<WebviewUniversal> {
  WebViewController webViewController = WebViewController();

  @override
  void initState() {
    super.initState();
    webViewController.init(
      context: context,
      setState: setState,
      uri: Uri.parse("https://flutter.dev"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      controller: webViewController,
    );
  }
}
