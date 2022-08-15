import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class PushNotif {
  static final fcm = FirebaseMessaging.instance;

  static initNotification() async {
    try {
      await fcm.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );

      FirebaseMessaging.onMessage.listen(_onMessage);
      FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);
      FirebaseMessaging.onMessageOpenedApp.listen(_onOpened);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static void _onMessage(RemoteMessage message) async {
    debugPrint("Kamu Menerima Pesan 1 ${message.notification?.title}");
    debugPrint("${message.notification?.body}");
  }

  static Future<void> _onBackgroundMessage(RemoteMessage message) async {
    debugPrint("Kamu Menerima Pesan 2 ${message.notification?.title}");
    debugPrint("${message.notification?.body}");
  }

  static void _onOpened(RemoteMessage message) async {
    final data = message.data;
    debugPrint("Kamu bisa melakukannyaa $data");
  }

  static void _handlerMessage() async {
    final message = await fcm.getInitialMessage();
    if (message != null) {
      final data = message.data;
      debugPrint("Kamu pasti bisa terus lanjutkan");
    }
  }
}
