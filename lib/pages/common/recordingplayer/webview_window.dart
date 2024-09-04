import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/main.dart';
import 'package:webview_windows/webview_windows.dart';

class WebviewUniversalWindow extends StatefulWidget {
  const WebviewUniversalWindow({super.key, required this.url});
  final String url;
  @override
  _WebviewUniversalWindowState createState() => _WebviewUniversalWindowState();
}

class _WebviewUniversalWindowState extends State<WebviewUniversalWindow> {
  final _controller = WebviewController();
  bool _isInitialized = false;
  Future<void> initPlatformState() async {
    try {
      await _controller.initialize();
      await _controller.setPopupWindowPolicy(WebviewPopupWindowPolicy.deny);
      setState(() {
        _isInitialized = true;
      });
      await _controller.loadUrl(widget.url);
    } catch (e) {
      print('Error initializing WebView: $e');
    }
  }

  Future<WebviewPermissionDecision> _onPermissionRequested(
      String url, WebviewPermissionKind kind, bool isUserInitiated) async {
    final decision = await showDialog<WebviewPermissionDecision>(
      context: navigatorKey.currentContext!,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('WebView permission requested'),
        content: Text('WebView has requested permission for \'$kind\''),
        actions: <Widget>[
          TextButton(
            onPressed: () =>
                Navigator.pop(context, WebviewPermissionDecision.deny),
            child: const Text('Deny'),
          ),
          TextButton(
            onPressed: () =>
                Navigator.pop(context, WebviewPermissionDecision.allow),
            child: const Text('Allow'),
          ),
        ],
      ),
    );
    return decision ?? WebviewPermissionDecision.none;
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }
    return Webview(
      _controller,
      permissionRequested: _onPermissionRequested,
    );
  }
}
