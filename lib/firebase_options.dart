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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB0w4PXM8IM6euBe3fdtSZtCc16noy6uq8',
    appId: '1:203365894880:web:622c69b34ee77e46625e85',
    messagingSenderId: '203365894880',
    projectId: 'nin-page',
    authDomain: 'nin-page.firebaseapp.com',
    storageBucket: 'nin-page.firebasestorage.app',
    measurementId: 'G-83M42JT588',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDVxj3CDdDypMJyg_TwTXM4b56zfI76PLE',
    appId: '1:203365894880:android:e34ea7788aee73d8625e85',
    messagingSenderId: '203365894880',
    projectId: 'nin-page',
    storageBucket: 'nin-page.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAfwYDOc2y74PJ8UOimDTMGRZqTNsFDFaE',
    appId: '1:203365894880:ios:c0a3f7a38de5fca9625e85',
    messagingSenderId: '203365894880',
    projectId: 'nin-page',
    storageBucket: 'nin-page.firebasestorage.app',
    iosBundleId: 'com.example.ninPage',
  );
}
