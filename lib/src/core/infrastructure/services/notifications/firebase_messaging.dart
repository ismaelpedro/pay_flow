import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'notifications_service.dart';

class FirebaseMessagingService {
  final NotificationService _notificationService;

  FirebaseMessagingService(this._notificationService);

  Future<void> initialize() async {
    await FirebaseMessaging.instance.requestPermission();
    await FirebaseMessaging.instance.subscribeToTopic('all');
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      badge: true,
      sound: true,
      alert: true,
    );
    getDeviceFirebaseToken();
    _onMessage();
  }

  Future<void> getDeviceFirebaseToken() async {
    final token = await FirebaseMessaging.instance.getToken();
    debugPrint('=======================================');
    log('TOKEN FIREBASE ==> $token');
    debugPrint('=======================================');
  }

  void _onMessage() {
    FirebaseMessaging.onMessage.listen((message) {
      RemoteNotification? notification = message.notification;

      if (notification != null) {
        _notificationService.showLocalNotification(
          CustomNotification(
            id: message.notification.hashCode,
            title: notification.title!,
            body: notification.body!,
          ),
        );
      }
    });
  }
}
