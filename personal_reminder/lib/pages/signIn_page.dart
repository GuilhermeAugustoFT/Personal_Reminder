import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:personal_reminder/controllers/AuthController.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  var nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          color: Color(0xFF121212),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: size.width * 0.13,
                    right: size.width * 0.13,
                    top: size.width * 0.3),
                child: Text(
                  "Bem vindo(a) ao Personal Reminder\nPara prosseguir digite seu nome:",
                  style:
                      GoogleFonts.montserrat(color: Colors.white, fontSize: 30),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: size.width * 0.13,
                    right: size.width * 0.13,
                    top: size.width * 0.04),
                child: TextField(
                  controller: nameController,
                  style: GoogleFonts.montserrat(
                      color: Colors.white, fontSize: size.width * 0.065),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Color(0xFF202020),
                    filled: true,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  final authController = AuthController();
                  authController.registerUser(context, nameController.text);
                },
                child: Container(
                  margin: EdgeInsets.only(top: size.width * 0.7),
                  height: size.width * 0.13,
                  width: size.width * 0.735,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: size.width * 0.015),
                    child: Text(
                      "Continuar",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 30),
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
