// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDjt9DfRKt1rbnAXHNs8FDv3Gqm57tbSAc',
    appId: '1:1078122765614:web:bbda76b4f9dd1e59d0aebf',
    messagingSenderId: '1078122765614',
    projectId: 'insp-c2312',
    authDomain: 'insp-c2312.firebaseapp.com',
    storageBucket: 'insp-c2312.firebasestorage.app',
    measurementId: 'G-KZ75N25K83',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyARfQr7dFfA1-yjqvehk4VMxQQjEkUntEw',
    appId: '1:1078122765614:android:c948591f0144dc10d0aebf',
    messagingSenderId: '1078122765614',
    projectId: 'insp-c2312',
    storageBucket: 'insp-c2312.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCd_gaEk5lzzSblv-AXNpBQD7tfNxg0ptY',
    appId: '1:1078122765614:ios:824ec710202eb845d0aebf',
    messagingSenderId: '1078122765614',
    projectId: 'insp-c2312',
    storageBucket: 'insp-c2312.firebasestorage.app',
    iosBundleId: 'com.insp.mobileplayer',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCd_gaEk5lzzSblv-AXNpBQD7tfNxg0ptY',
    appId: '1:1078122765614:ios:eb72fe8e00cc590fd0aebf',
    messagingSenderId: '1078122765614',
    projectId: 'insp-c2312',
    storageBucket: 'insp-c2312.firebasestorage.app',
    iosBundleId: 'com.example.insp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDjt9DfRKt1rbnAXHNs8FDv3Gqm57tbSAc',
    appId: '1:1078122765614:web:77d127701463635dd0aebf',
    messagingSenderId: '1078122765614',
    projectId: 'insp-c2312',
    authDomain: 'insp-c2312.firebaseapp.com',
    storageBucket: 'insp-c2312.firebasestorage.app',
    measurementId: 'G-4Z7JQ4PX1V',
  );

}