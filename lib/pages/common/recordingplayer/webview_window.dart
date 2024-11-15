import 'package:flutter/material.dart';
import 'package:desktop_webview_window/desktop_webview_window.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

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
      final userDataFolderWindows = await _getWebViewPath();
      _webview = await WebviewWindow.create(
        configuration: CreateConfiguration(
          userDataFolderWindows: userDataFolderWindows,
        ),
      );
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

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return const Center(
      child: Text('WebView loaded in a separate window'),
    );
  }

  Future<String> _getWebViewPath() async {
    final document = await getApplicationDocumentsDirectory();
    return p.join(
      document.path,
      'desktop_webview_window',
    );
  }
}
