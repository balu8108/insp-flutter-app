import 'package:flutter/services.dart';

class MacOSSecure {
  static const MethodChannel _channel =
      MethodChannel('com.example.macos/screenshot');

  static Future<void> disableScreenshots() async {
    try {
      await _channel.invokeMethod('disableScreenshot');
    } on PlatformException catch (e) {
      print('Failed to disable screenshots: ${e.message}');
    }
  }

  static Future<void> enableScreenshots() async {
    try {
      await _channel.invokeMethod('enableScreenshot');
    } on PlatformException catch (e) {
      print('Failed to enable screenshots: ${e.message}');
    }
  }
}
