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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDmfRLgNNA6BUVaHdeg2WNMyrcOWPJHwSk',
    appId: '1:512876446333:web:aef417e4af36326c47a714',
    messagingSenderId: '512876446333',
    projectId: 'teste-firebase-ezequielzz',
    authDomain: 'teste-firebase-ezequielzz.firebaseapp.com',
    storageBucket: 'teste-firebase-ezequielzz.appspot.com',
    measurementId: 'G-RDEMDLQ7G9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDa3iMp_PQl6HmjwCfn1pC2nFyco_TPCCI',
    appId: '1:512876446333:android:0fb55249fcb7722347a714',
    messagingSenderId: '512876446333',
    projectId: 'teste-firebase-ezequielzz',
    storageBucket: 'teste-firebase-ezequielzz.appspot.com',
  );
}
