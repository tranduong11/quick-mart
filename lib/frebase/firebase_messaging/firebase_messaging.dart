import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:quick_mart/routers/app_router_path.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  /// Xử lý thông báo khi ứng dụng chạy nền hoặc bị đóng hoàn toàn.
  Future<void> handlerMessaging(RemoteMessage message) async {
    if (message.notification != null) {
      print('Title: ${message.notification?.title}');
      print('Body: ${message.notification?.body}');
      print('Payload: ${message.data}');
    }
  }

  /// Xử lý khi người dùng click vào thông báo để mở ứng dụng.
  static handleMessage(RemoteMessage? message, BuildContext context) {
    if (message == null) return;

    String? screen = message.data['screen'];
    String? extraData = message.data['extra'];

    if (screen == 'wishlistsPage') {
      Navigator.pushNamed(
        context,
        AppRoutePath.wishlistsPage,
        arguments: {'extraData': extraData},
      );
    }
  }

  /// Thiết lập hiển thị thông báo khi ứng dụng đang mở (foreground).
  Future<void> initPushNotification(BuildContext context) async {
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        handleMessage(message, context);
      }
    });

    FirebaseMessaging.onMessage.listen((message) {
      print('Foreground Message: ${message.notification?.body}');
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      handleMessage(message, context);
    });
  }

  /// Yêu cầu quyền nhận thông báo.
  Future<void> initNotification(BuildContext context) async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print('Token: ${fCMToken}');
    FirebaseMessaging.onBackgroundMessage(handlerMessaging);
    initPushNotification(context);
  }
}
