import 'dart:io';

import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions? get currentPlatform {
    if (Platform.isAndroid) {
      return const FirebaseOptions(
          apiKey: 'AIzaSyCr4CpSOxYV90IcUfH4Ll2XAFr1JKo0XEI',
          appId: '1:1087748091751:android:ffb85a64618044b33809c2',
          messagingSenderId: '1087748091751',
          projectId: 'lazy-ant',
          authDomain: "https://lazy-ant.firebaseapp.com/__/auth/handler",
          androidClientId:
              "17633046111-461mhq8j5a2ia93lk9l5g4prjmgo1kec.apps.googleusercontent.com");
    } else if (Platform.isIOS) {
      return const FirebaseOptions(
          apiKey: 'AIzaSyCr4CpSOxYV90IcUfH4Ll2XAFr1JKo0XEI',
          appId: '1:17633046111:ios:cb38c4ac5c338c529675ea',
          messagingSenderId: '17633046111',
          projectId: 'coinbud-7accb',
          iosBundleId: "com.coinbud.coinbud",
          authDomain: "https://coinbud-7accb.firebaseapp.com/__/auth/handler",
          iosClientId:
              "17633046111-sv4fmu1tfmb94ki88gilpq6uq2uhab9h.apps.googleusercontent.com");
    }
    return null;
  }
}
