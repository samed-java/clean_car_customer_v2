import 'package:clean_car_customer_v2/utils/services/firebase/analytics/event.dart';
import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class EventLogger {
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  final FacebookAppEvents facebookAppEvents = FacebookAppEvents();

  EventLogger();

  void init() async {
    await analytics.setDefaultEventParameters({"version": '1.0.0'});
    await facebookAppEvents.setAutoLogAppEventsEnabled(true);
    await facebookAppEvents.setAdvertiserTracking(enabled: true);
  }

  logEvent({required Event event, Map<String, dynamic>? data}) async {
    Map<String, String>? newData = data
        ?.map((key, value) => MapEntry<String, String>(key, value.toString()));
    await facebookAppEvents.logEvent(name: event.name);
    await analytics.logEvent(name: event.name, parameters: newData);
  }

  logOpenApp({Map<String, dynamic>? data}) async {
    Map<String, String>? newData = data
        ?.map((key, value) => MapEntry<String, String>(key, value.toString()));
    await facebookAppEvents.logEvent(name: "app_open", parameters: data);
    await analytics.logAppOpen(parameters: newData);
  }

  logLogin({Map<String, dynamic>? data}) async {
    Map<String, String>? newData = data
        ?.map((key, value) => MapEntry<String, String>(key, value.toString()));
    await facebookAppEvents.logEvent(
        name: 'login',
        parameters: filterOutNulls(<String, Object?>{
          "method": "phone",
          if (data != null) ...data,
        }));
    await facebookAppEvents.setUserData(
        phone: data!["phone"].toString(), firstName: data["name"]);
    await analytics.logLogin(
      loginMethod: "phone",
      parameters: newData,
    );

  }

  logSearch({required String searchTerm, Map<String, dynamic>? data}) async {
    Map<String, String>? newData = data
        ?.map((key, value) => MapEntry<String, String>(key, value.toString()));
    await facebookAppEvents.logEvent(
        name: 'search',
        parameters: filterOutNulls(
          <String, Object?>{
            "search_term": searchTerm,
            if (data != null) ...data,
          },
        ));
    await analytics.logSearch(
      searchTerm: searchTerm,
      parameters: newData,
    );

  }

  logSignUp({Map<String, dynamic>? data}) async {
    Map<String, String>? newData = data
        ?.map((key, value) => MapEntry<String, String>(key, value.toString()));
    await facebookAppEvents.logEvent(
        name: 'sign_up',
        parameters: filterOutNulls(
          <String, Object?>{
            "method": "phone",
            if (data != null) ...data,
          },
        ));
    await facebookAppEvents.setUserData(
        phone: data!["phone"], firstName: data["name"]);
    await analytics.logSignUp(
      signUpMethod: "phone",
      parameters: newData,
    );

  }
}
