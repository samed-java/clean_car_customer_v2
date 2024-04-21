import 'dart:io';

import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions? get currentPlatform {
    if (Platform.isAndroid) {
      return const FirebaseOptions(
        apiKey: 'AIzaSyDzE8bZpBuZY9RgYNT7wOvVbivLnhbdLkI',
        appId: '1:986219836536:android:b9936ec11a8e367961e98d',
        messagingSenderId: '986219836536',
        projectId: 'cleancarbaku',
      );
    } else if (Platform.isIOS) {
      return null;
      //   const FirebaseOptions(
      //   apiKey: 'AIzaSyDuOKPRKq8oEgh-AWdDggYvZwhjn1e9HrU',
      //   appId: '1:986219836536:ios:dcf9315ff3bcf77261e98d',
      //   messagingSenderId: '986219836536',
      //   projectId: 'cleancarbaku',
      //   iosBundleId: "com.washing.customer",
      // );
    }
    return null;
  }
}