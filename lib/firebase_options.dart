// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCqynGA_k7NgZniw0j3ppVHrZ-cb-8QK1Y',
    appId: '1:911738977182:web:9e93d2ae2416a9ea03348f',
    messagingSenderId: '911738977182',
    projectId: 'listening-firebase',
    authDomain: 'listening-firebase.firebaseapp.com',
    storageBucket: 'listening-firebase.appspot.com',
    measurementId: 'G-KV7BTCMX6H',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAeHW7XUSY0exCJvbRFn9kZ-dWshIFHg1w',
    appId: '1:911738977182:android:b6b8c6459dcc767f03348f',
    messagingSenderId: '911738977182',
    projectId: 'listening-firebase',
    storageBucket: 'listening-firebase.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD-oPacNAQc2CMKLRwncrAou2RUv3pU7uo',
    appId: '1:911738977182:ios:4f72b37e8fb163af03348f',
    messagingSenderId: '911738977182',
    projectId: 'listening-firebase',
    storageBucket: 'listening-firebase.appspot.com',
    iosBundleId: 'com.example.listeningApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD-oPacNAQc2CMKLRwncrAou2RUv3pU7uo',
    appId: '1:911738977182:ios:0ff927ccfbd55aea03348f',
    messagingSenderId: '911738977182',
    projectId: 'listening-firebase',
    storageBucket: 'listening-firebase.appspot.com',
    iosBundleId: 'com.example.listeningApp.RunnerTests',
  );
}
