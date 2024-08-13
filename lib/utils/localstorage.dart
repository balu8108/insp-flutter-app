import 'package:flutter/foundation.dart'; // For kIsWeb and defaultTargetPlatform
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universal_html/html.dart' as html;
import 'dart:io' show Platform; // For desktop platforms

Future<void> storeData(String key, String value) async {
  if (kIsWeb) {
    // Store data in web's LocalStorage
    html.window.localStorage[key] = value;
  } else if (defaultTargetPlatform == TargetPlatform.iOS ||
      defaultTargetPlatform == TargetPlatform.android) {
    // Store data in SharedPreferences for mobile
    final sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.setString(key, value);
  } else if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    // Store data in SharedPreferences for desktop
    final sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.setString(key, value);
  } else {
    // Handle other platforms if necessary
    print('Unsupported platform for storing data.');
  }
}

Future<String?> getData(String key) async {
  if (kIsWeb) {
    // Retrieve data from web's LocalStorage
    return html.window.localStorage[key];
  } else if (defaultTargetPlatform == TargetPlatform.iOS ||
      defaultTargetPlatform == TargetPlatform.android) {
    // Retrieve data from SharedPreferences for mobile
    final sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getString(key);
  } else if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    // Retrieve data from SharedPreferences for desktop
    final sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getString(key);
  } else {
    // Handle other platforms if necessary
    print('Unsupported platform for retrieving data.');
    return null;
  }
}

Future<void> logoutData(String key) async {
  if (kIsWeb) {
    // Remove data from web's LocalStorage
    html.window.localStorage.remove(key);
  } else if (defaultTargetPlatform == TargetPlatform.iOS ||
      defaultTargetPlatform == TargetPlatform.android) {
    // Remove data from SharedPreferences for mobile
    final sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.remove(key);
  } else if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    // Remove data from SharedPreferences for desktop
    final sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.remove(key);
  } else {
    // Handle other platforms if necessary
    print('Unsupported platform for removing data.');
  }
}
