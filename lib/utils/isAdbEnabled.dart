import 'package:flutter/services.dart';

class DeviceStatusChecker {
  static const platform = MethodChannel('com.example/deviceStatus');

  // Method to check if ADB is enabled
  static Future<bool> isAdbEnabled() async {
    try {
      final bool isAdbEnabled = await platform.invokeMethod('isAdbEnabled');
      return isAdbEnabled;
    } on PlatformException catch (e) {
      print("Failed to check ADB status: '${e.message}'.");
      return false;
    }
  }

  // Method to check if the device is rooted
  static Future<bool> isDeviceRooted() async {
    try {
      final bool isDeviceRooted = await platform.invokeMethod('isDeviceRooted');
      return isDeviceRooted;
    } on PlatformException catch (e) {
      print("Failed to check if the device is rooted: '${e.message}'.");
      return false;
    }
  }
}
