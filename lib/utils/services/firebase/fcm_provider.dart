import 'dart:io';

import 'package:clean_car_customer_v2/utils/pager/go.dart';
import 'package:firebase_messaging/firebase_messaging.dart'
    show FirebaseMessaging, RemoteMessage;
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../pager/pager.dart';
import 'firebase_service.dart';

class FCMProvider {
  static BuildContext? _context;

  static void setContext(BuildContext context) =>
      FCMProvider._context = context;

  /// when app is in the foreground
  static Future<void> onTapNotification(NotificationResponse? response) async {
    if (FCMProvider._context == null) return;
    if (response?.payload == null) {
      Go.to(Pager.notifications);
    } else {
      final Map<dynamic, dynamic> data =
          FCMProvider.convertPayload(response!.payload!);
      if (data["type"] == "rating") {
        Go.to(Pager.rating(
            reservationId: data["reservation_id"].toString(),
            branch: data["branch"].toString(),
            service: data["service"].toString())); // }
      } else {
        Go.to(Pager.notifications);
      }
    }
  }

  static Map<dynamic, dynamic> convertPayload(String payload) {
    final String _payload = payload.substring(1, payload.length - 1);
    List<String> _split = [];
    _payload.split(",")..forEach((String s) => _split.addAll(s.split(":")));
    Map<dynamic, dynamic> _mapped = {};
    for (int i = 0; i < _split.length + 1; i++) {
      if (i % 2 == 1)
        _mapped.addAll({_split[i - 1].trim().toString(): _split[i].trim()});
    }
    return _mapped;
  }

  static Future<void> onMessage() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print(message.toString());
      print(message.data);
      //if (FCMProvider._refreshNotifications != null) await FCMProvider._refreshNotifications!(true);
      // if this is available when Platform.isIOS, you'll receive the notification twice
      // if (Platform.isAndroid) {
      await FirebaseService.localNotificationsPlugin.show(
        0,
        message.notification!.title,
        message.notification!.body,
        FirebaseService.platformChannelSpecifics,
        payload: message.data.toString(),
      );
      // }
    });
  }

  static Future<void> backgroundHandler(RemoteMessage message) async {}

  static onMessageRoute(Function(RemoteMessage message) onMessage) {
    FirebaseMessaging.onMessage.listen((message) async {
      onMessage.call(message);
    });
  }

  static onMessageOpenRoute(Function(RemoteMessage message) onMessage) {
    FirebaseMessaging.onMessageOpenedApp.listen((message) async {
      onMessage.call(message);
    });
  }

  static onInitMessageOpenRoute(
      Function(RemoteMessage message) onMessage) async {
    RemoteMessage? message =
        await FirebaseMessaging.instance.getInitialMessage();
    if (message != null) onMessage.call(message);
  }
}
