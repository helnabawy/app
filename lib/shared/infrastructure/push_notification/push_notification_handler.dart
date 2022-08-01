import 'dart:async';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotificationHandler {
  late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
  static late BuildContext context;
  static PushNotificationHandler instance = PushNotificationHandler._();
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  PushNotificationHandler._();

  PushNotificationHandler();

  static late NotificationSettings _settings;

  setupNotification(BuildContext cxt) async {
    context = cxt;
    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var android = const AndroidInitializationSettings('@mipmap/ic_launcher');
    var ios = const IOSInitializationSettings();
    var initSettings = InitializationSettings(android: android, iOS: ios);
    _flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onSelectNotification: flutterNotificationClick,
    );
    _settings = await messaging.requestPermission(provisional: true);
    print('User granted permission: ${_settings.authorizationStatus}');

    if (_settings.authorizationStatus == AuthorizationStatus.authorized) {
      messaging.setForegroundNotificationPresentationOptions(alert: false, badge: false, sound: false);
      getDeviceToken();
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print('_____________________Message data:${message.data}');
        _showLocalNotification(message);
      });

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        print('A new onMessageOpenedApp event was published!');
        flutterNotificationClick(json.encode(message.data));
      });

      FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    }
  }

  static Future<String?> getDeviceToken() async {
    if (_settings.authorizationStatus == AuthorizationStatus.authorized) {
      try {
        final token = await messaging.getToken();
        return token;
      } catch (e) {
        rethrow;
      }
    }
    return null;
  }

  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    print('Handling a background message: ${message.data}');
    flutterNotificationClick(json.encode(message.data));
  }

  _showLocalNotification(RemoteMessage? message) async {
    if (message == null) return;
    var android = AndroidNotificationDetails(
      '${DateTime.now()}',
      'Default',
      priority: Priority.high,
      importance: Importance.max,
      playSound: true,
      shortcutId: DateTime.now().toIso8601String(),
    );
    var ios = IOSNotificationDetails();
    var _platform = NotificationDetails(android: android, iOS: ios);
    _flutterLocalNotificationsPlugin.show(
        DateTime.now().microsecond, '${message.notification?.title}', '${message.notification?.body}', _platform,
        payload: json.encode(message.data));
  }

  static Future flutterNotificationClick(String? payload) async {
    print('background mode ! $payload');
    var _data = json.decode('$payload');
    // sendSMS();
    int _type = int.parse(_data['type'] ?? '4');
  }
}
