import 'package:flutter/material.dart';
import 'package:personal_reminder/models/Task.dart';

import 'package:google_fonts/google_fonts.dart';

class TaskWidget extends StatefulWidget {
  String stringTask;

  TaskWidget({required this.stringTask});

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

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.width * 0.23,
      color: Colors.black87,
      margin: EdgeInsets.only(top: 3),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                task.name,
                textAlign: TextAlign.start,
                style: GoogleFonts.montserrat(
                    color: Color(0xFFFF5C5C), fontSize: size.width * 0.065),
              ),
              Container(
                width: size.width * 0.7,
                margin: EdgeInsets.only(left: size.width * 0.03),
                child: SingleChildScrollView(
                  child: Text(
                    task.description,
                    style: GoogleFonts.montserrat(
                        color: Color(0xFFA8A8A8), fontSize: size.width * 0.035),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: size.width * 0.05),
            height: size.width * 0.2,
            width: 1,
            color: Color(0xFFFFBD4A),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(left: size.width * 0.03),
                child: Text(
                  task.hour,
                  style: GoogleFonts.montserrat(
                      color: Color(0xFFA8A8A8), fontSize: size.width * 0.05),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: size.width * 0.03),
                child: Text(
                  task.date,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      color: Color(0xFFA8A8A8), fontSize: size.width * 0.035),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
