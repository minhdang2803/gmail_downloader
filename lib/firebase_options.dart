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
        return linux;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA5bvSde-ZBNVp6t-Nl8BYlL0keevwy-qk',
    appId: '1:393571818824:web:d86caa1cb9dbf0e9fe277d',
    messagingSenderId: '393571818824',
    projectId: 'downloader-1f3d9',
    authDomain: 'downloader-1f3d9.firebaseapp.com',
    storageBucket: 'downloader-1f3d9.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA0bIaZg0128NebKkZ5R0wXOMxdP-YCbLA',
    appId: '1:393571818824:android:b74ac9620d813a64fe277d',
    messagingSenderId: '393571818824',
    projectId: 'downloader-1f3d9',
    storageBucket: 'downloader-1f3d9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB1JF626T6VAb9KYhFWL0xgp6G7QT6P05Q',
    appId: '1:393571818824:ios:6e0957ffebbbfa45fe277d',
    messagingSenderId: '393571818824',
    projectId: 'downloader-1f3d9',
    storageBucket: 'downloader-1f3d9.appspot.com',
    iosBundleId: 'com.example.attatchmentsDownloader',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB1JF626T6VAb9KYhFWL0xgp6G7QT6P05Q',
    appId: '1:393571818824:ios:6e0957ffebbbfa45fe277d',
    messagingSenderId: '393571818824',
    projectId: 'downloader-1f3d9',
    storageBucket: 'downloader-1f3d9.appspot.com',
    iosBundleId: 'com.example.attatchmentsDownloader',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA5bvSde-ZBNVp6t-Nl8BYlL0keevwy-qk',
    appId: '1:393571818824:web:b2c3871192a046c8fe277d',
    messagingSenderId: '393571818824',
    projectId: 'downloader-1f3d9',
    authDomain: 'downloader-1f3d9.firebaseapp.com',
    storageBucket: 'downloader-1f3d9.appspot.com',
  );

  static const FirebaseOptions linux = FirebaseOptions(
    apiKey: 'AIzaSyA5bvSde-ZBNVp6t-Nl8BYlL0keevwy-qk',
    appId: '1:393571818824:web:93d9706231417292fe277d',
    messagingSenderId: '393571818824',
    projectId: 'downloader-1f3d9',
    authDomain: 'downloader-1f3d9.firebaseapp.com',
    storageBucket: 'downloader-1f3d9.appspot.com',
  );
}
