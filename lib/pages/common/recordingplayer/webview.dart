import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class WebViewExample extends StatefulWidget {
  @override
  _WebViewExampleState createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  @override
  void initState() {
    super.initState();
    _openBrowser();
  }

  Future<void> _openBrowser() async {
    const url =
        'https://app.tpstreams.com/embed/gcma48/uZfMzhPDJEs/?access_token=e5572614-8772-4d6d-8b9f-fc54f9644bc0';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Opening browser...'),
      ),
    );
  }
}
