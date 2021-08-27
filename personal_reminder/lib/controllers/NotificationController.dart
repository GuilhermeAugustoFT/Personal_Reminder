import 'package:flutter_local_notifications/flutter_local_notifications.dart'
    as notifs;
import 'package:rxdart/subjects.dart' as rxSub;

class NotificationClass {
  String title;
  String body;
  String payload;
  NotificationClass({
    required this.title,
    required this.body,
    required this.payload,
  });

  Future<void> scheduleNotification(
      {required notifs.FlutterLocalNotificationsPlugin notifsPlugin,
      required String id,
      required String title,
      required String body,
      required DateTime scheduledTime}) async {
    var androidSpecifics = notifs.AndroidNotificationDetails(
      id, // This specifies the ID of the Notification
      'Scheduled notification', // This specifies the name of the notification channel
      'A scheduled notification', //This specifies the description of the channel
      icon: 'icon',
    );
    var iOSSpecifics = notifs.IOSNotificationDetails();
    var platformChannelSpecifics = notifs.NotificationDetails(
        android: androidSpecifics, iOS: iOSSpecifics);
    await notifsPlugin.schedule(
        0,
        title,
        "Scheduled notification",
        scheduledTime,
        platformChannelSpecifics); // This literally schedules the notification
  }
}
