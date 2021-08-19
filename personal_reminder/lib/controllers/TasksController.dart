import 'package:personal_reminder/models/Task.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TasksController {
  Future<List<String>?> getPendingTasks() async {
    // RETORNA A LISTA COM TODAS AS TAREFAS
    List<String>? list = [];
    final instance = await SharedPreferences.getInstance();
    list = instance.getStringList("pendingTasks");

    return list;
  }

  Future<List<String>?> getCompletedTasks() async {
    // RETORNA A LISTA COM TODAS AS TAREFAS CONCLUIDAS
    List<String>? list = [];
    final instance = await SharedPreferences.getInstance();
    list = instance.getStringList("completedTasks");

    return list;
  }

  void addToPending(Task task) async {
    // ADICIONAR TAREFA  NA LISTA DO SHARED PREFERENCES
    List<String>? list = [];
    final instance = await SharedPreferences.getInstance();
    if (await getPendingNumber() != 0)
      list = instance.get("pendingTasks") as List<String>?;
    list!.add(task.toJson());
    instance.setStringList("pendingTasks", list);
  }

  void addToCompleted(Task task) async {
    // ADICIONAR TAREFA CONCLUIDA NA LISTA DO SHARED PREFERENCES
    List<String>? list = [];
    final instance = await SharedPreferences.getInstance();
    if (await getCompletedNumber() != 0)
      list = instance.get("completedTasks") as List<String>?;
    list!.add(task.toJson());
    instance.setStringList("completedTasks", list);
  }

  Future<int> getPendingNumber() async {
    // RETORNAR O NUMERO DE TAREFAS CONCLUIDAS
    final instance = await SharedPreferences.getInstance();
    if (!instance.containsKey("pendingTasks")) {
      return 0;
    }

    List<String> list = [];
    list = await getPendingTasks() as List<String>;
    return list.length;
  }

  Future<int> getCompletedNumber() async {
    // RETORNAR O NUMERO DE TAREFAS CONCLUIDAS
    final instance = await SharedPreferences.getInstance();
    if (!instance.containsKey("completedTasks")) {
      return 0;
    }

    List<String> list = [];
    list = getCompletedTasks() as List<String>;
    return list.length;
  }
}
