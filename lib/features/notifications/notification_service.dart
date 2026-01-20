import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final _notifications = FlutterLocalNotificationsPlugin();
  final _uploadChannel = const AndroidNotificationChannel(
    'uploads',
    'Загрузки',
  );

  Future<void> init() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const ios = DarwinInitializationSettings();

    const settings = InitializationSettings(
      android: android,
      iOS: ios,
    );

    await _notifications.initialize(settings);
    if (Platform.isAndroid) {
      await _setupAndroid();
    }
    if (Platform.isIOS) {
      await _setupIos();
    }
  }

  Future<void> _setupAndroid() async {
    final androidPlugin = _notifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();

    await androidPlugin?.createNotificationChannel(_uploadChannel);
    await androidPlugin?.requestNotificationsPermission();
  }

  Future<void> _setupIos() async {
    final iosPlugin = _notifications
        .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin
        >();

    await iosPlugin?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  Future<void> showNotification(String text) async {
    const androidDetails = AndroidNotificationDetails(
      'uploads',
      'Загрузки',
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentSound: true,
      presentBadge: true,
    );

    const details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _notifications.show(
      0,
      'Загрузка изображения',
      text,
      details,
    );
  }
}
