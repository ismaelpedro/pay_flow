import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../domain/entities/custom_notification.dart';
import 'notification_service.dart';

class FirebaseMessagingService {
  final NotificationService _notificationSettings;
  FirebaseMessagingService(this._notificationSettings);

  Future<void> initialize() async {
    await FirebaseMessaging.instance.subscribeToTopic('all');
    await FirebaseMessaging.instance.requestPermission();
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      badge: true,
      sound: true,
      alert: true,
    );

    await _getDeviceFirebaseToken();
    await _onMessage();
  }

  Future<void> _getDeviceFirebaseToken() async {
    final String? token = await FirebaseMessaging.instance.getToken();
    debugPrint('==================================');
    debugPrint('Token Firebase: $token');
    debugPrint('==================================');
  }

  Future<void> _onMessage() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final RemoteNotification? notification = message.notification;
      final AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        _notificationSettings.showNotification(
          CustomNotification(
            id: android.hashCode,
            title: notification.title,
            body: notification.body,
            payload: '',
          ),
        );
      }
    });
  }
}
