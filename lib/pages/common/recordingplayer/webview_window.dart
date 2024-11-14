import 'package:flutter/material.dart';
import 'package:desktop_webview_window/desktop_webview_window.dart';

class WebviewUniversalWindow extends StatefulWidget {
  const WebviewUniversalWindow({
    super.key,
    required this.url,
    required this.streamStatus,
  });

  final String url;
  final String streamStatus;

  @override
  _WebviewUniversalWindowState createState() => _WebviewUniversalWindowState();
}

class _WebviewUniversalWindowState extends State<WebviewUniversalWindow> {
  Webview? _webview;
  bool _isInitialized = false;

  Future<void> initPlatformState() async {
    try {
      _webview = await WebviewWindow.create();
      _webview!.launch(widget.url);
      setState(() {
        _isInitialized = true;
      });
    } catch (e) {
      print('Error initializing WebView: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  @override
  void dispose() {
    _webview?.close();
    super.dispose();
  }

  // @override
  // void didUpdateWidget(covariant WebviewUniversalWindow oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   if (oldWidget.streamStatus != widget.streamStatus) {
  //     _webview.loadUrl(widget.url);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return const Center(
      child: Text('WebView loaded in a separate window'),
    );
  }
}
