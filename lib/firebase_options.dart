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
    apiKey: 'AIzaSyBus0ECiobgjpM6n5LmIJ_KLJeHxdem5o0',
    appId: '1:134211219561:web:2ba1fa312169ebe37a72f8',
    messagingSenderId: '134211219561',
    projectId: 'cognix-app',
    authDomain: 'cognix-app.firebaseapp.com',
    storageBucket: 'cognix-app.firebasestorage.app',
    measurementId: 'G-E75T11LE0P',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA6BagpjJl4mf4enGAB7AJch3e7rdGLL5Q',
    appId: '1:134211219561:android:bfde848af7ca5b247a72f8',
    messagingSenderId: '134211219561',
    projectId: 'cognix-app',
    storageBucket: 'cognix-app.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCoeWbRYktjglhm6xUs9VPBbclgpCGY-rM',
    appId: '1:134211219561:ios:274501179b7cf1f87a72f8',
    messagingSenderId: '134211219561',
    projectId: 'cognix-app',
    storageBucket: 'cognix-app.firebasestorage.app',
    iosBundleId: 'com.example.cognix',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCoeWbRYktjglhm6xUs9VPBbclgpCGY-rM',
    appId: '1:134211219561:ios:274501179b7cf1f87a72f8',
    messagingSenderId: '134211219561',
    projectId: 'cognix-app',
    storageBucket: 'cognix-app.firebasestorage.app',
    iosBundleId: 'com.example.cognix',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBus0ECiobgjpM6n5LmIJ_KLJeHxdem5o0',
    appId: '1:134211219561:web:b0af60f650f3c9177a72f8',
    messagingSenderId: '134211219561',
    projectId: 'cognix-app',
    authDomain: 'cognix-app.firebaseapp.com',
    storageBucket: 'cognix-app.firebasestorage.app',
    measurementId: 'G-1B14DHMQ59',
  );
}
