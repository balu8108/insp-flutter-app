import 'package:flutter/services.dart';

class ScreenshotBlocker {
  static const MethodChannel _channel = MethodChannel('screenshot_blocker');
  // Method to disable screenshots
  static Future<void> disableScreenshots() async {
    try {
      await _channel.invokeMethod('disableScreenshots');
    } on PlatformException catch (e) {
      print("Failed to disable screenshots: '${e.message}'.");
    }
  }

  // Method to enable screenshots (undo prevention)
  static Future<void> enableScreenshots() async {
    try {
      await _channel.invokeMethod('enableScreenshots');
    } on PlatformException catch (e) {
      print("Failed to enable screenshots: '${e.message}'.");
    }
  }
}
