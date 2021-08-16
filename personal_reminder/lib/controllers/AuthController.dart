import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  void currentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();
    if (instance.containsKey("PersonalReminderUser")) {
      await Future.delayed(Duration(seconds: 3));
      Navigator.of(context).pushReplacementNamed("/home");
    } else {
      await Future.delayed(Duration(seconds: 3));
      Navigator.of(context).pushReplacementNamed("/signIn");
    }
  }

  void registerUser(BuildContext context, String name) async {
    final instance = await SharedPreferences.getInstance();
    instance.setString("PersonalReminderUser", name);
    Navigator.of(context).pushReplacementNamed("/home");
  }

  Future<String?> getUser() async {
    final instance = await SharedPreferences.getInstance();
    String? name = instance.getString("PersonalReminderUser");
    return name;
  }
}
