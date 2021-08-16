import 'package:flutter/material.dart';
import 'package:personal_reminder/controllers/AuthController.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final authController = AuthController();
    var userName = authController.getUser();

    return Container(
      height: size.height,
      width: size.width,
      color: Colors.white,
    );
  }
}
