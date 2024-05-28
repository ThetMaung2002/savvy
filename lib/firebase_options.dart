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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBBJgqXHI-HpBdUHDHviVwbU9HMfPQqskI',
    appId: '1:97650605420:android:4f3d9b60de1f31025e8749',
    messagingSenderId: '97650605420',
    projectId: 'savvy-9db26',
    storageBucket: 'savvy-9db26.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDeQXlU_6nrqjQjUBWZGL570AuH0s5XuF4',
    appId: '1:97650605420:ios:79bc1e32847fd83f5e8749',
    messagingSenderId: '97650605420',
    projectId: 'savvy-9db26',
    storageBucket: 'savvy-9db26.appspot.com',
    iosBundleId: 'com.example.savvy',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyByyD2KxiBX573NmnNAJcPbqKTZDFUADIw',
    appId: '1:97650605420:web:0086b42a1ffc77995e8749',
    messagingSenderId: '97650605420',
    projectId: 'savvy-9db26',
    authDomain: 'savvy-9db26.firebaseapp.com',
    storageBucket: 'savvy-9db26.appspot.com',
    measurementId: 'G-ZL0WWF1P7L',
  );

}