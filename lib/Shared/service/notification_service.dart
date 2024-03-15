import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationServices {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  void requestNotificationPermission() async {
    NotificationSettings notificationSettings = await firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,  // User gets an option on notification to turn it off
      sound: true
    );

    if(notificationSettings.authorizationStatus == AuthorizationStatus.authorized) {
      print("notificationSettings android authorized");
    } else if(notificationSettings.authorizationStatus == AuthorizationStatus.provisional) {
      print("notificationSettings iPhone authorized");
    }
    else {
      print("notificationSettings NOT");
    }
  }

  // This token will expire with time.
  Future<String?> getDeviceToken() async {
    return await firebaseMessaging.getToken();
  }

  void isDeviceTokenRefreash() {
    firebaseMessaging.onTokenRefresh.listen((event) {
      event.toString();
      print("Device token is re-freashed.");
    });
  }
}