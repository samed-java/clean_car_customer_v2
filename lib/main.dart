import 'dart:io';

import 'package:clean_car_customer_v2/app.dart';
import 'package:clean_car_customer_v2/locator.dart';
import 'package:clean_car_customer_v2/utils/language/language_init.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

void main() async {
  await init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const App());
}

init() async {
  WidgetsFlutterBinding.ensureInitialized();
  //FirebaseService.initializeFirebase();

  Geolocator.requestPermission();
  setUpLocator();
  InitializeLanguage.init();
  //locator.get<StorageService>().init();

  //DatabaseHelper.init();
}
