import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:webview_win_floating/webview_win_floating.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';

class WebviewUniversalWindow extends StatefulWidget {
  const WebviewUniversalWindow(
      {super.key, required this.url, required this.streamStatus});
  final String url, streamStatus;
  @override
  _WebviewUniversalWindowState createState() => _WebviewUniversalWindowState();
}

class _WebviewUniversalWindowState extends State<WebviewUniversalWindow> {
  late WinWebViewController? _controller;
  bool _isInitialized = false;
  Future<void> initPlatformState() async {
    try {
      _controller = WinWebViewController(userDataFolder: await _getWebViewPath());
      _controller?.setJavaScriptMode(JavaScriptMode.unrestricted);

      setState(() {
        _isInitialized = true;
      });
      await _controller?.loadRequest(Uri.parse(widget.url));
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
    _controller = null;
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant WebviewUniversalWindow oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.streamStatus != widget.streamStatus) {
       _controller?.loadRequest(Uri.parse(widget.url));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }
    return WinWebViewWidget(controller: _controller!);
  }

  Future<String> _getWebViewPath() async {
    final document = await getApplicationDocumentsDirectory();
    return p.join(
      document.path,
      'desktop_webview_window',
    );
  }
}
