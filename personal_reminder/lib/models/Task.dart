import 'dart:convert';

class Task {
  String name;
  String description;
  String date;
  String notificationMode;

  Task({
    required this.name,
    required this.description,
    required this.date,
    required this.notificationMode,
  });

  String getName() {
    return this.name;
  }

  String getDescription() {
    return this.description;
  }

  String getDate() {
    return this.date;
  }

  String getNotificationMode() {
    return this.notificationMode;
  }
}
