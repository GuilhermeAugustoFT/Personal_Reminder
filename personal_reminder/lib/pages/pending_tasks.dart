import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_reminder/controllers/TasksController.dart';
import 'package:personal_reminder/models/Task.dart';
import 'package:personal_reminder/widgets/task_widget.dart';

class PendingTasksPage extends StatefulWidget {
  PendingTasksPage({required this.userName});
  String userName;

  @override
  _PendingTasksPageState createState() => _PendingTasksPageState();
}

class _PendingTasksPageState extends State<PendingTasksPage> {
  String time = "";
  void getTime() {
    var now = DateTime.now();
    if (now.hour >= 6 && now.hour < 12) {
      time = "Bom dia";
    } else if (now.hour >= 12 && now.hour < 18) {
      time = "Boa tarde";
    } else {
      time = "Boa noite";
    }
  }

  int tasksNumber = 0;
  List<String> tasksList = [];

  Future<void> getTasks() async {
    var tasksController = TasksController();
    tasksController.addToPending(Task(
        name: "Lição de Matemática",
        description:
            "Exercícios 4 a 10 do livro de Matemátiasdasdasdasdasdasdasdasdasdasdasdasdca",
        date: "12/11/2021",
        hour: "12:10",
        notificationMode: "1"));

    tasksNumber = await tasksController.getPendingNumber();
    if (tasksNumber > 0) {
      tasksList = (await tasksController.getPendingTasks())!;
    }
  }

  void initState() {
    super.initState();
    getTime();
    getTasks();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      color: Color(0xFF121212),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.03, top: size.width * 0.1, bottom: 25),
              child: Text(
                "$time ${this.widget.userName},\nVocê possui $tasksNumber tarefas pendentes",
                style: GoogleFonts.montserrat(
                    color: Colors.white, fontSize: size.width * 0.057),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                height: size.height * 0.7,
                child: ListView.builder(
                    itemCount: tasksNumber,
                    itemBuilder: (context, index) {
                      return TaskWidget(
                        stringTask: tasksList[index],
                      );
                    }),
              ),
            ),
            // LISTA DE TAREFAS PENDENTES
          ],
        ),
      ),
    );
  }
}
