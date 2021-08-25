import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:personal_reminder/pages/completed_tasks.dart';
import 'package:personal_reminder/pages/pending_tasks.dart';

class HomePage extends StatefulWidget {
  int page;
  HomePage({
    Key? key,
    required this.page,
  }) : super(key: key);

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
    actualPage = this.widget.page;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void getUserName() async {
    final instance = await SharedPreferences.getInstance();
    name = instance.getString("PersonalReminderUser").toString();
    setState(() {});
  }

  Widget getBody() {
    if (actualPage == 0)
      return PendingTasksPage(userName: name);
    else
      return CompletedTasksPage(userName: name);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        extendBody: true,
        body: getBody(),
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
                      // setState(() {
                      //   this.actualPage = 0;
                      // });
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(
                            page: 0,
                          ),
                        ),
                      );
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
                      // this.actualPage = 1;
                      // setState(() {});
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(
                            page: 1,
                          ),
                        ),
                      );
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
