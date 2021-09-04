import 'package:flutter/material.dart';
import 'package:personal_reminder/pages/add_task_page.dart';
import 'package:personal_reminder/pages/home_page.dart';
import 'package:personal_reminder/pages/signIn_page.dart';
import 'package:personal_reminder/pages/splash_page.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
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
