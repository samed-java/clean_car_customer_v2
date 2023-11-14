import 'package:clean_car_customer_v2/app.dart';
import 'package:clean_car_customer_v2/locator.dart';
import 'package:flutter/material.dart';
import 'data/services/local/storage_service.dart';

void main() async {
  await init();
  runApp(const App());
}

init() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load(fileName: Configs.env);
  //FirebaseService.initializeFirebase();
  setUpLocator();
  locator.get<StorageService>().init();

  //DatabaseHelper.init();
}
