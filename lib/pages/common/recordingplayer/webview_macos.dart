import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewMacOs extends StatefulWidget {
  const WebviewMacOs(
      {super.key, required this.url, required this.streamStatus});

  final String url, streamStatus;

  @override
  _WebviewMacOsState createState() => _WebviewMacOsState();
}

class _WebviewMacOsState extends State<WebviewMacOs> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize the WebViewController
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setUserAgent('Safari')
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
Page resource error:
  code: ${error.errorCode}
  description: ${error.description}
  errorType: ${error.errorType}
  isForMainFrame: ${error.isForMainFrame}
            ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              debugPrint('Blocking navigation to ${request.url}');
              return NavigationDecision.prevent;
            }
            debugPrint('Allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },
          onHttpError: (HttpResponseError error) {
            debugPrint('Error occurred on page: ${error.response?.statusCode}');
          },
          onUrlChange: (UrlChange change) {
            debugPrint('URL change to ${change.url}');
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  void didUpdateWidget(covariant WebviewMacOs oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.streamStatus != widget.streamStatus) {
      // Update the URL in the WebViewController
      _controller.loadRequest(Uri.parse(widget.url));
    }
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: _controller);
  }
}
