import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDGHqaZN9mkkpgMmS1JiRxGmkswMLUSN-0',
    appId: '1:797476675234:android:ffabc223f75de7561101fb',
    messagingSenderId: '797476675234',
    projectId: 'quick-mart-bf609',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDF7Py0drWWUW1sQcK-reVR7zRklypcJz8',
    appId: '1:797476675234:ios:070294fe14f1b6f71101fb',
    messagingSenderId: '797476675234',
    projectId: 'quick-mart-bf609',
    storageBucket: 'quick-mart-bf609.appspot.com',
    iosClientId: 'com.googleusercontent.apps.797476675234-3al9go0e7fj82eb2na37e5sejifl1f1t',
    iosBundleId: 'com.example.quickMart',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBqLWsqFjYAdGyihKTahMRDQMo0N6NVjAs',
    appId: '1:963656261848:ios:d9e01cfe8b675dfcb237ad',
    messagingSenderId: '963656261848',
    projectId: 'flutterfire-ui-codelab',
    storageBucket: 'flutterfire-ui-codelab.appspot.com',
    iosClientId: '963656261848-v7r3vq1v6haupv0l1mdrmsf56ktnua60.apps.googleusercontent.com',
    iosBundleId: 'com.example.complete',
  );
}
