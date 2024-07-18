import 'package:clean_car_customer_v2/app.dart';
import 'package:clean_car_customer_v2/locator.dart';
import 'package:clean_car_customer_v2/utils/language/language_init.dart';
import 'package:clean_car_customer_v2/utils/services/firebase/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'data/services/local/storage_service.dart';

void main() async {
  await init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const App());
}

init() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Permission.notification.request();
  await FirebaseService.initializeFirebase();
  try {
    var tracking = await AppTrackingTransparency.requestTrackingAuthorization();
    if(tracking == TrackingStatus.authorized){
      AppTrackingTransparency.getAdvertisingIdentifier();
    }
  } on PlatformException {
  }

  Location.instance.requestPermission();
  await setUpLocator();
  await locator.get<StorageService>().init();

  print(locator.get<StorageService>().getLangCode());
  if (locator.get<StorageService>().getLangCode().isEmpty) {
    await locator.get<StorageService>().setLangCode("az");
  }

  // await Permission.notification.isGranted.then((value) async {
  if (locator.get<StorageService>().getPhoneNumber() != null) {
    await FirebaseService.firebaseMessaging.subscribeToTopic(
        "customer${locator.get<StorageService>().getPhoneNumber()!}");
  }
  // });

  await InitializeLanguage.init();

  //DatabaseHelper.init();
}
