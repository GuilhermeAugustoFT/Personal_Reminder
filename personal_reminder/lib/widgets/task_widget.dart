import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:personal_reminder/controllers/TasksController.dart';
import 'package:personal_reminder/models/Task.dart';
import 'package:personal_reminder/pages/edit_task_page.dart';

class TaskWidget extends StatefulWidget {
  String stringTask;
  int index;
  int page; // 0 - pending, 1 - completed

  TaskWidget({
    Key? key,
    required this.stringTask,
    required this.index,
    required this.page,
  }) : super(key: key);

  @override
  _TaskWidgetState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  late Task task;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    task = Task.fromJson(this.widget.stringTask);
  }

  var actualPage;
  var tasksController = TasksController();
  var taskColor = Colors.black87;
  var titleColor = Color(0xFFFF5C5C);
  var textColor = Colors.white;
  var checked = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      height: size.width * 0.23,
      color: this.widget.page == 0 ? taskColor : Color(0xFF121212),
      margin: EdgeInsets.only(top: 3),
      child: Stack(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditTaskPage(
                        task: task,
                        index: this.widget.index,
                      ),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: size.width * 0.03),
                      child: Text(
                        task.name,
                        textAlign: TextAlign.start,
                        style: GoogleFonts.montserrat(
                            color: this.widget.page == 0
                                ? titleColor
                                : Color(0xFF646566),
                            fontSize: size.width * 0.065),
                      ),
                    ),
                    Container(
                      width: size.width * 0.7,
                      margin: EdgeInsets.only(left: size.width * 0.03),
                      child: SingleChildScrollView(
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: size.width * 0.02),
                              child: Icon(
                                Icons.schedule_outlined,
                                color: this.widget.page == 0
                                    ? textColor
                                    : Color(0xFF646566),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: size.width * 0.02,
                                  right: size.width * 0.16),
                              child: Text(
                                task.hour,
                                style: GoogleFonts.montserrat(
                                    color: this.widget.page == 0
                                        ? textColor
                                        : Color(0xFF646566),
                                    fontSize: size.width * 0.035),
                              ),
                            ),
                            Icon(
                              Icons.date_range_outlined,
                              color: this.widget.page == 0
                                  ? textColor
                                  : Color(0xFF646566),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: size.width * 0.02),
                              child: Text(
                                task.date,
                                style: GoogleFonts.montserrat(
                                    color: this.widget.page == 0
                                        ? textColor
                                        : Color(0xFF646566),
                                    fontSize: size.width * 0.035),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: size.width * 0.05),
                height: size.width * 0.2,
                width: 1,
                color: this.widget.page == 0 ? textColor : Color(0xFF646566),
              ),
              GestureDetector(
                onTap: () {
                  if (this.widget.page == 0) {
                    taskColor = Color(0xFF121212);
                    titleColor = Color(0xFF646566);
                    textColor = Color(0xFF646566);
                    checked = true;
                    Future.delayed(Duration(seconds: 3));
                    tasksController.removeFromPending(this.widget.index);
                    tasksController.addToCompleted(task);
                  } else {
                    //NAO FUNCIONANDO
                    taskColor = Colors.black87;
                    titleColor = Color(0xFFFF5C5C);
                    textColor = Colors.white;
                    checked = false;

                    //FUNCIONANDO
                    Future.delayed(Duration(seconds: 3));
                    tasksController.removeFromCompleted(this.widget.index);
                    tasksController.addToPending(task);
                  }
                  setState(() {});
                },
                child: Container(
                  margin: EdgeInsets.only(left: size.width * 0.057),
                  width: size.width * 0.12,
                  height: size.width * 0.12,
                  child: Visibility(
                    visible: this.widget.page == 0 ? checked : true,
                    child: AnimatedCard(
                      direction: AnimatedCardDirection.right,
                      child: Icon(
                        Icons.done_sharp,
                        color: Color(0xFF646566),
                        size: size.width * 0.1,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: taskColor,
                      border: Border.all(color: Color(0xFFA8A8A8), width: 2)),
                ),
              )
            ],
          ),
          Visibility(
            visible: this.widget.page == 0 ? checked : true,
            child: AnimatedCard(
              direction: AnimatedCardDirection.left,
              duration: Duration(milliseconds: 500),
              child: Container(
                margin: EdgeInsets.only(
                    left: size.width * 0.03, right: size.width * 0.03),
                color: Color(0xFF646566),
                height: 1,
              ),
            ),
          )
        ],
      ),
    );
  }
}
