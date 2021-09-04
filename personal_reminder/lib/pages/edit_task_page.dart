import 'package:animated_card/animated_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:personal_reminder/controllers/TasksController.dart';
import 'package:personal_reminder/models/Task.dart';

import 'home_page.dart';

class EditTaskPage extends StatefulWidget {
  Task task;
  int index;
  EditTaskPage({
    Key? key,
    required this.task,
    required this.index,
  }) : super(key: key);

  @override
  _EditTaskPage createState() => _EditTaskPage();
}

var nameController = TextEditingController();
var descriptionController = TextEditingController();
var time = "__:__";
var date = "__/__/__";
var simple = true;
var ready = false;

class _EditTaskPage extends State<EditTaskPage> {
  Future<Null> pickDate(BuildContext context) async {
    var selectedDate;
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(DateTime.now().year),
        lastDate: DateTime(DateTime.now().year + 10));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        date = '';
        date += DateFormat.d().format(selectedDate).padLeft(2, '0');
        date += '/' + DateFormat.M().format(selectedDate).padLeft(2, '0');
        date += '/' + DateFormat.y().format(selectedDate);
      });
  }

  Future<Null> pickTime(BuildContext context) async {
    var selectedTime;
    var hour;
    var minute;

    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 12, minute: 0),
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        hour = selectedTime.hour.toString().padLeft(2, '0');
        minute = selectedTime.minute.toString().padLeft(2, '0');
        time = hour + ':' + minute;
      });
  }

  void initState() {
    super.initState();
    setData();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  bool verifyData() {
    if (nameController.text != "" && date != "__/__/__" && time != "__:__")
      return true;
    return false;
  }

  void setData() {
    nameController.text = this.widget.task.getName();
    descriptionController.text = this.widget.task.getDescription();
    time = this.widget.task.getHour();
    date = this.widget.task.getDate();
    if (this.widget.task.getNotificationMode() == "simple") {
      simple = true;
    } else {
      simple = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    ready = verifyData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF191919),
        iconTheme: IconThemeData(
          color: Color(0xFFA8A8A8),
        ),
        title: Text(
          "Editar Tarefa",
          style: GoogleFonts.montserrat(
            fontSize: size.width * 0.065,
            color: Color(0xFFA8A8A8),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          color: Color(0xFF202020),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedCard(
                direction: AnimatedCardDirection.right,
                child: Container(
                  margin: EdgeInsets.only(top: size.width * 0.05),
                  child: Text(
                    "Nome da Tarefa",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.montserrat(
                      fontSize: size.width * 0.065,
                      color: Color(0xFFA8A8A8),
                    ),
                  ),
                ),
              ),
              AnimatedCard(
                direction: AnimatedCardDirection.left,
                child: Container(
                  margin: EdgeInsets.only(
                      left: size.width * 0.05,
                      right: size.width * 0.15,
                      top: size.width * 0.03),
                  child: TextField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(20),
                    ],
                    controller: nameController,
                    style: GoogleFonts.montserrat(
                        color: Color(0xFFFF5C5C), fontSize: size.width * 0.05),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Color(0xFF191919),
                      filled: true,
                    ),
                  ),
                ),
              ),
              AnimatedCard(
                direction: AnimatedCardDirection.right,
                child: Container(
                  margin: EdgeInsets.only(top: size.width * 0.05),
                  child: Text(
                    "Descrição",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.montserrat(
                      fontSize: size.width * 0.065,
                      color: Color(0xFFA8A8A8),
                    ),
                  ),
                ),
              ),
              AnimatedCard(
                direction: AnimatedCardDirection.left,
                child: Container(
                  margin: EdgeInsets.only(
                      left: size.width * 0.05,
                      right: size.width * 0.15,
                      top: size.width * 0.03),
                  child: TextField(
                    controller: descriptionController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    style: GoogleFonts.montserrat(
                        color: Color(0xFFFF5C5C), fontSize: size.width * 0.05),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Color(0xFF191919),
                      filled: true,
                    ),
                  ),
                ),
              ),
              AnimatedCard(
                direction: AnimatedCardDirection.right,
                child: Container(
                  margin: EdgeInsets.only(
                    top: size.width * 0.05,
                  ),
                  child: Text(
                    "Selecione o horário e a data",
                    style: GoogleFonts.montserrat(
                      fontSize: size.width * 0.065,
                      color: Color(0xFFA8A8A8),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AnimatedCard(
                    direction: AnimatedCardDirection.left,
                    child: GestureDetector(
                      onTap: () {
                        pickTime(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: size.width * 0.05),
                        height: size.width * 0.25,
                        width: size.width * 0.25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          border:
                              Border.all(color: Color(0xFFA8A8A8), width: 2),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.schedule,
                              color: Color(0xFFA8A8A8),
                              size: size.width * 0.1,
                            ),
                            Text(
                              time,
                              style: GoogleFonts.montserrat(
                                color: Color(0xFFA8A8A8),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  AnimatedCard(
                    direction: AnimatedCardDirection.right,
                    child: GestureDetector(
                      onTap: () {
                        pickDate(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: size.width * 0.05),
                        height: size.width * 0.25,
                        width: size.width * 0.25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          border:
                              Border.all(color: Color(0xFFA8A8A8), width: 2),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.date_range,
                              color: Color(0xFFA8A8A8),
                              size: size.width * 0.1,
                            ),
                            Text(
                              date,
                              style: GoogleFonts.montserrat(
                                color: Color(0xFFA8A8A8),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              // AnimatedCard(
              //   direction: AnimatedCardDirection.right,
              //   child: Container(
              //     margin: EdgeInsets.only(
              //       top: size.width * 0.05,
              //     ),
              //     child: Text(
              //       "Selecione modo de notificação",
              //       style: GoogleFonts.montserrat(
              //         fontSize: size.width * 0.065,
              //         color: Color(0xFFA8A8A8),
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: size.width * 0.03,
              // ),
              // AnimatedCard(
              //   direction: AnimatedCardDirection.right,
              //   child: Row(
              //     children: [
              //       Checkbox(
              //         value: simple,
              //         onChanged: (newValue) {
              //           simple = true;
              //           setState(() {});
              //         },
              //       ),
              //       Text(
              //         "Simpes - Receba notificação apenas no \ndia de conclusão",
              //         style: GoogleFonts.montserrat(
              //           fontSize: size.width * 0.04,
              //           color: Color(0xFFA8A8A8),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // AnimatedCard(
              //   direction: AnimatedCardDirection.right,
              //   child: Row(
              //     children: [
              //       Checkbox(
              //         value: !simple,
              //         onChanged: (newValue) {
              //           simple = false;
              //           setState(() {});
              //         },
              //       ),
              //       Text(
              //         "Importante - Receba notificação a cada \n2 horas até o dia de conclusão",
              //         style: GoogleFonts.montserrat(
              //           fontSize: size.width * 0.04,
              //           color: Color(0xFFA8A8A8),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              AnimatedCard(
                direction: AnimatedCardDirection.bottom,
                child: GestureDetector(
                  onTap: () {
                    if (ready) {
                      final tasksController = TasksController();

                      tasksController.removeFromPending(this.widget.index);
                      var notificationMode = "";
                      if (simple)
                        notificationMode = "simple";
                      else
                        notificationMode = "important";
                      this.widget.task = Task(
                        name: nameController.text,
                        description: descriptionController.text,
                        date: date,
                        hour: time,
                        notificationMode: notificationMode,
                      );

                      tasksController.addToPending(this.widget.task);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(
                            page: 0,
                          ),
                        ),
                      );
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        top: size.width * 0.5, left: size.width * 0.13),
                    height: size.width * 0.13,
                    width: size.width * 0.735,
                    decoration: BoxDecoration(
                      color: ready ? Colors.green : Color(0xFFA8A8A8),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: size.width * 0.015),
                      child: Text(
                        "Salvar",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                            color: Colors.white, fontSize: 30),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
