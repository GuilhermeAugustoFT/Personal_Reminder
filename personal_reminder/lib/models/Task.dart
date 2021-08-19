import 'dart:convert';

class Task {
  String name;
  String description;
  String date;
  String hour;
  String notificationMode;

  Task({
    required this.name,
    required this.description,
    required this.date,
    required this.hour,
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

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'date': date,
      'hour': hour,
      'notificationMode': notificationMode,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      name: map['name'],
      description: map['description'],
      date: map['date'],
      hour: map['hour'],
      notificationMode: map['notificationMode'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source));

  Task copyWith({
    String? name,
    String? description,
    String? date,
    String? hour,
    String? notificationMode,
  }) {
    return Task(
      name: name ?? this.name,
      description: description ?? this.description,
      date: date ?? this.date,
      hour: hour ?? this.hour,
      notificationMode: notificationMode ?? this.notificationMode,
    );
  }

  @override
  String toString() {
    return 'Task(name: $name, description: $description, date: $date, hour: $hour, notificationMode: $notificationMode)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Task &&
        other.name == name &&
        other.description == description &&
        other.date == date &&
        other.hour == hour &&
        other.notificationMode == notificationMode;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        description.hashCode ^
        date.hashCode ^
        hour.hashCode ^
        notificationMode.hashCode;
  }
}
