import 'package:personal_reminder/models/Task.dart';

class TasksController {
  List<Task> getPendingTasks() {
    // RETORNA A LISTA COM TODAS AS TAREFAS
    List<Task> list = [];
    return list;
  }

  List<Task> getCompletedTasks() {
    // RETORNA A LISTA COM TODAS AS TAREFAS CONCLUIDAS
    List<Task> list = [];
    return list;
  }

  void addToPending() {
    // ADICIONAR TAREFA  NA LISTA DO SHARED PREFERENCES
  }

  void addToCompleted() {
    // ADICIONAR TAREFA CONCLUIDA NA LISTA DO SHARED PREFERENCES
  }

  int getPendingNumber() {
    // RETORNAR O NUMERO DE TAREFAS CONCLUIDAS
    return 10;
  }

  int getCompletedNumber() {
    // RETORNAR O NUMERO DE TAREFAS CONCLUIDAS
    return 100;
  }
}
