import 'package:flutter/material.dart';
import 'package:personal_reminder/pages/completed_tasks.dart';
import 'package:personal_reminder/pages/pending_tasks.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int actualPage = 0;
  var name = "";
  @override
  void initState() {
    super.initState();
    getUserName();
  }

  void getUserName() async {
    final instance = await SharedPreferences.getInstance();
    name = instance.getString("PersonalReminderUser").toString();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        extendBody: true,
        body: Column(children: [
          Visibility(
            visible: actualPage == 0 ? true : false,
            child: PendingTasksPage(userName: name),
          ),
          Visibility(
            visible: actualPage == 1 ? true : false,
            child: CompletedTasksPage(userName: name),
          ),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "/addTask");
          },
          child: Icon(
            Icons.add,
            size: 40,
          ),
          backgroundColor: Color(0xFFA8A8A8),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: Color(0xFF202020),
          child: Container(
            height: size.width * 0.18,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        this.actualPage = 0;
                      });
                    },
                    child: Icon(
                      Icons.event_note,
                      size: 40,
                      color: actualPage == 0
                          ? Color(0xFFA8A8A8)
                          : Color(0xFF121212),
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      this.actualPage = 1;
                      setState(() {});
                    },
                    child: Icon(
                      Icons.event_available,
                      size: 40,
                      color: actualPage == 1
                          ? Color(0xFFA8A8A8)
                          : Color(0xFF121212),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
