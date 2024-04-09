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
    apiKey: 'AIzaSyAitqyXPCYPbUPOxyPKMoRR8dmvLn_f-4M',
    appId: '1:647873846765:web:ce5d8818a6811960ecdbe4',
    messagingSenderId: '647873846765',
    projectId: 'chitchat-669bf',
    authDomain: 'chitchat-669bf.firebaseapp.com',
    storageBucket: 'chitchat-669bf.appspot.com',
    measurementId: 'G-FYZGDP251Y',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCZ1I15dek9cnSgUljUGYzE-aqRyVAcn94',
    appId: '1:647873846765:android:da50ca2202385d80ecdbe4',
    messagingSenderId: '647873846765',
    projectId: 'chitchat-669bf',
    storageBucket: 'chitchat-669bf.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD0UT2dVOqBC_xD87bSTWde6-iTO7GUTyM',
    appId: '1:647873846765:ios:b84b48982808426cecdbe4',
    messagingSenderId: '647873846765',
    projectId: 'chitchat-669bf',
    storageBucket: 'chitchat-669bf.appspot.com',
    iosBundleId: 'com.example.chitChat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD0UT2dVOqBC_xD87bSTWde6-iTO7GUTyM',
    appId: '1:647873846765:ios:249803c1a654b2dfecdbe4',
    messagingSenderId: '647873846765',
    projectId: 'chitchat-669bf',
    storageBucket: 'chitchat-669bf.appspot.com',
    iosBundleId: 'com.example.chitChat.RunnerTests',
  );
}