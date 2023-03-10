import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../../presenter/pay_flow_app.dart';
import '../entities/custom_notification.dart';

class NotificationService {
  late FlutterLocalNotificationsPlugin _localNotification;
  late AndroidNotificationDetails _androidDetails;

  NotificationService() {
    _localNotification = FlutterLocalNotificationsPlugin();
    _setupNotifications();
  }

  Future<void> _setupNotifications() async {
    await _setupTimeZone();
    await _initializeNotifications();
  }

  Future<void> _setupTimeZone() async {
    tz.initializeTimeZones();
    // final String timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
    // tz.setLocalLocation(tz.getLocation(timeZoneName));
  }

  Future<void> _initializeNotifications() async {
    const AndroidInitializationSettings android = AndroidInitializationSettings('@mipmap/ic_launcher');

    DarwinInitializationSettings iOs = DarwinInitializationSettings(
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );

    await _localNotification.initialize(
      InitializationSettings(android: android, iOS: iOs),
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );
  }

  void onDidReceiveLocalNotification(
    int id,
    String? title,
    String? body,
    String? payload,
  ) async {
    // display a dialog with the notification details, tap ok to go to another page
    showDialog(
      context: navigatorKey.currentContext!,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title ?? ''),
        content: Text(body ?? ''),
        actions: <Widget>[
          CupertinoDialogAction(
            isDefaultAction: true,
            child: const Text('Ok'),
            onPressed: () async {},
          )
        ],
      ),
    );
  }

  void onDidReceiveNotificationResponse(
    NotificationResponse notificationResponse,
  ) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      debugPrint('notification payload: $payload');
    }
  }

  Future<void> cleanAllNotifications() async {
    await _localNotification.cancelAll();
  }

  Future<void> showNotification(CustomNotification notification) async {
    final DateTime date = DateTime.now().add(const Duration(seconds: 5));

    _androidDetails = const AndroidNotificationDetails(
      'lembretes',
      'lembretes',
      channelDescription: 'Canal para teste',
      importance: Importance.max,
      priority: Priority.max,
      enableVibration: true,
      enableLights: true,
      audioAttributesUsage: AudioAttributesUsage.alarm,
      playSound: true,
      autoCancel: false,
      visibility: NotificationVisibility.public,
      fullScreenIntent: true,
      color: Colors.black,
      icon: '@mipmap/ic_launcher',
      colorized: true,
    );

    _localNotification.zonedSchedule(
      notification.id!,
      notification.title,
      notification.body,
      tz.TZDateTime.from(date, tz.local),
      payload: notification.payload,
      androidAllowWhileIdle: true,
      NotificationDetails(android: _androidDetails),
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  Future<void> checkNotifications() async {
    final NotificationAppLaunchDetails? details = await _localNotification.getNotificationAppLaunchDetails();
    if (details != null && details.didNotificationLaunchApp) {}
  }
}
