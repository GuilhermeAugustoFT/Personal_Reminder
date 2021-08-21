import 'package:flutter/material.dart';
import 'package:personal_reminder/models/Task.dart';
import 'package:personal_reminder/pages/add_task_page.dart';
import 'package:personal_reminder/pages/edit_task_page.dart';
import 'package:personal_reminder/pages/home_page.dart';
import 'package:personal_reminder/pages/signIn_page.dart';
import 'package:personal_reminder/pages/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Personal Reminder",
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => SplashPage(),
        "/signIn": (context) => SignInPage(),
        "/home": (context) => HomePage(),
        "/addTask": (context) => AddTaskPage(),
      },
    );
  }
}
