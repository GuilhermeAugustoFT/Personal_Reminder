import 'package:flutter/material.dart';
import 'package:personal_reminder/pages/add_task_page.dart';
import 'package:personal_reminder/pages/home_page.dart';
import 'package:personal_reminder/pages/signIn_page.dart';
import 'package:personal_reminder/pages/splash_page.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  late FlutterLocalNotificationsPlugin localNotification;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var androidInitialize = new AndroidInitializationSettings('ic_launcher');
    var iOSInitialize = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        android: androidInitialize, iOS: iOSInitialize);

    localNotification = new FlutterLocalNotificationsPlugin();
    localNotification.initialize(initializationSettings);
    _showNotification();
  }

  Future _showNotification() async {
    var androidDetails = new AndroidNotificationDetails("channelID",
        "Local Notification", "Description jiajdoiajiojiojaiofjasoidjai",
        importance: Importance.high);
    var iosDetails = new IOSNotificationDetails();
    var generalNotificationDetails =
        new NotificationDetails(android: androidDetails, iOS: iosDetails);

    await localNotification.show(
        0, "BOSTA", "BOSTA SÓ QUE GRANFE", generalNotificationDetails);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Personal Reminder",
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => SplashPage(),
        "/signIn": (context) => SignInPage(),
        "/home": (context) => HomePage(page: 0),
        "/addTask": (context) => AddTaskPage(),
      },
    );
  }
}
