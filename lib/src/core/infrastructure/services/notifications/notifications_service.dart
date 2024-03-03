import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class CustomNotification {
  final int id;
  final String title;
  final String body;
  final String? payload;
  final RemoteMessage? remoteMessage;

  CustomNotification({
    required this.id,
    required this.title,
    required this.body,
    this.payload,
    this.remoteMessage,
  });
}

class NotificationService {
  late FlutterLocalNotificationsPlugin localNotificationsPlugin;
  late AndroidNotificationDetails androidDetails;
  late DarwinNotificationDetails iosDetails;

  NotificationService() {
    localNotificationsPlugin = FlutterLocalNotificationsPlugin();
    _setupPlatformsDetails();
    _setupNotifications();
  }

  void _setupPlatformsDetails() {
    androidDetails = const AndroidNotificationDetails(
      'lembretes_notifications_details',
      'Lembretes',
      channelDescription: 'Este canal é para lembretes!',
      importance: Importance.max,
      priority: Priority.max,
      enableVibration: true,
      playSound: true,
    );

    iosDetails = const DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      presentBanner: true,
    );
  }

  Future<void> _setupNotifications() async {
    await _setupTimezone();
    await _initializeNotifications();
  }

  Future<void> _setupTimezone() async {
    tz.initializeTimeZones();
    final String timeZoneName = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName));
  }

  Future<void> _initializeNotifications() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const apple = DarwinInitializationSettings(
      defaultPresentAlert: true,
      defaultPresentBadge: true,
      defaultPresentSound: true,
    );

    await localNotificationsPlugin
        .initialize(const InitializationSettings(android: android, iOS: apple));
  }

  void showNotificationScheduled(CustomNotification notification, Duration duration) {
    final date = DateTime.now().add(duration);

    localNotificationsPlugin.zonedSchedule(
      notification.id,
      notification.title,
      notification.body,
      tz.TZDateTime.from(date, tz.local),
      NotificationDetails(android: androidDetails, iOS: iosDetails),
      payload: notification.payload,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  void showLocalNotification(CustomNotification notification) {
    localNotificationsPlugin.show(
      notification.id,
      notification.title,
      notification.body,
      NotificationDetails(android: androidDetails, iOS: iosDetails),
      payload: notification.payload,
    );
  }
}
