import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_reminder/controllers/TasksController.dart';

class CompletedTasksPage extends StatefulWidget {
  CompletedTasksPage({required this.userName});
  String userName;

  @override
  _CompletedTasksPageState createState() => _CompletedTasksPageState();
}

class _CompletedTasksPageState extends State<CompletedTasksPage> {
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
  void getTasks() {
    var tasksController = TasksController();
    tasksNumber = tasksController.getCompletedNumber() as int;
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
                  left: size.width * 0.03, top: size.width * 0.1),
              child: Text(
                "$time ${this.widget.userName},\nVocê já concluiu $tasksNumber tarefas",
                textAlign: TextAlign.start,
                style: GoogleFonts.montserrat(
                    color: Colors.white, fontSize: size.width * 0.057),
              ),
            ),
            // LISTA DE TAREFAS CONCLUIDAS
          ],
        ),
      ),
    );
  }
}
