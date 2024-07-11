import 'package:clean_car_customer_v2/utils/services/firebase/analytics/event.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class EventLogger {
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  EventLogger();

  void init() async {
    await analytics.setDefaultEventParameters({"version": '1.0.0'});
  }

  logEvent({required Event event, Map<String, dynamic>? data}) async {
    Map<String, String>? newData = data?.map((key, value) => MapEntry<String, String>(key, value.toString()));
    await analytics.logEvent(name: event.name, parameters: newData);
  }

  logOpenApp({Map<String, dynamic>? data}) async {
    await analytics.logAppOpen();
  }

  logLogin({Map<String, dynamic>? data}) async {
    await analytics.logLogin(
      loginMethod: "phone",
      parameters: data,
    );
  }

  logSearch({required String searchTerm, Map<String, dynamic>? data}) async {
    await analytics.logSearch(
      searchTerm: searchTerm,
      parameters: data,
    );
  }

  logSignUp({Map<String, dynamic>? data}) async {
    await analytics.logSignUp(
      signUpMethod: "phone",
      parameters: data,
    );
  }
}
