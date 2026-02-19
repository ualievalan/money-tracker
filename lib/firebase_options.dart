import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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
    apiKey: 'AIzaSyDglfLRDM8dtnsX3y6btqFX9uxgzUaUAqo',
    appId: '1:753394864653:android:eeec39b9aa9049edd57b44',
    messagingSenderId: '753394864653',
    projectId: 'money-tracker-beksultan',
    storageBucket: 'money-tracker-beksultan.firebasestorage.app',
  );
  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCadCxhqqcSgaRe9pFDy5_-rnltcHVHaGA',
    appId: '1:753394864653:ios:187612e672167a6cd57b44',
    messagingSenderId: '753394864653',
    projectId: 'money-tracker-beksultan',
    storageBucket: 'money-tracker-beksultan.firebasestorage.app',
    iosBundleId: 'com.example.moneyTracker',
  );
}
