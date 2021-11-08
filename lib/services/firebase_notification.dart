import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// To receive the push notification
class FirebaseNotification {
  String _firebaseToken;
  FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
  final _firebaseMessaging = FirebaseMessaging();

  Future _showNotificationWithDefaultSound(String title, String body) async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.Max, priority: Priority.High);
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await _flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: 'Default_Sound',
    );
  }

  initializeNotification() {
    var initializationSettingsAndroid =
    AndroidInitializationSettings("scroll_icon1");
    var initializationSettingsIOS = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);

    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        var title = message["notification"]["title"];
        var body = message["notification"]["body"];
        print(title);
        _showNotificationWithDefaultSound(title, body);
      },
      onLaunch: (Map<String, dynamic> message) async {
        var title = message["notification"]["title"];
        var body = message["notification"]["body"];
        _showNotificationWithDefaultSound(title, body);
      },
      onResume: (Map<String, dynamic> message) async {
        var title = message["notification"]["title"];
        var body = message["notification"]["body"];
        _showNotificationWithDefaultSound(title, body);
      },
    );
    _firebaseMessaging.getToken().then((String token) {
      if (token != null) {
        _firebaseToken = token;
      }
      print("Token: " + _firebaseToken);
    });
  }


}
