import 'package:personal_reminder/models/Task.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TasksController {
  Future<List<String>?> getPendingTasks() async {
    List<String>? list = [];
    final instance = await SharedPreferences.getInstance();
    if (instance.containsKey("pendingTasks")) {
      list = instance.getStringList("pendingTasks");
    }
    return list;
  }

  Future<List<String>?> getCompletedTasks() async {
    List<String>? list = [];
    final instance = await SharedPreferences.getInstance();
    if (instance.containsKey("completedTasks")) {
      list = instance.getStringList("completedTasks");
    }

    return list;
  }

  void addToPending(Task task) async {
    List<String>? list = [];
    final instance = await SharedPreferences.getInstance();
    if (await getPendingNumber() != 0)
      list = instance.get("pendingTasks") as List<String>?;
    list!.add(task.toJson());
    instance.setStringList("pendingTasks", list);
  }

  void addToCompleted(Task task) async {
    List<String>? list = [];
    final instance = await SharedPreferences.getInstance();
    if (await getCompletedNumber() != 0)
      list = instance.get("completedTasks") as List<String>?;
    list!.add(task.toJson());
    instance.setStringList("completedTasks", list);
  }

  Future<int> getPendingNumber() async {
    final instance = await SharedPreferences.getInstance();
    if (!instance.containsKey("pendingTasks")) {
      return 0;
    }

    List<String> list = [];
    list = await getPendingTasks() as List<String>;
    return list.length;
  }

  Future<int> getCompletedNumber() async {
    final instance = await SharedPreferences.getInstance();
    if (!instance.containsKey("completedTasks")) {
      return 0;
    }

    List<String> list = [];
    list = await getCompletedTasks() as List<String>;
    return list.length;
  }

  void removeFromPending(int index) async {
    List<String> tasks = await getPendingTasks() as List<String>;
    tasks.remove(tasks[index]);
    final instance = await SharedPreferences.getInstance();
    instance.remove("pendingTasks");
    instance.setStringList("pendingTasks", tasks);
  }

  void removeFromCompleted(int index) async {
    List<String> tasks = await getCompletedTasks() as List<String>;
    tasks.remove(tasks[index]);
    final instance = await SharedPreferences.getInstance();
    instance.remove("completedTasks");
    instance.setStringList("completedTasks", tasks);
  }
}
