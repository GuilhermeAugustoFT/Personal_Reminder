import 'package:flutter/material.dart';
import 'package:personal_reminder/controllers/AuthController.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final authController = AuthController();
    authController.currentUser(context);
    return Container(
      height: size.height,
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(children: [
            Container(
              margin: EdgeInsets.only(left: size.width * 0.21),
              height: size.width * 0.07,
              width: size.width * 0.07,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
                color: Color(0xFFFF5C5C),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              height: size.width * 0.07,
              width: size.width * 0.07,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
                color: Color(0xFFA8A8A8),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              height: size.width * 0.07,
              width: size.width * 0.07,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
                color: Color(0xFFFFBD4A),
              ),
            ),
          ]),
          RichText(
            text: TextSpan(
                text: "P ",
                style: TextStyle(
                  color: Color(0xFFFF5C5C),
                  fontSize: size.width * 0.15,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: "E R S O N A L",
                    style: TextStyle(
                      color: Color(0xFFA8A8A8),
                      fontSize: size.width * 0.08,
                    ),
                  )
                ]),
          ),
          RichText(
            text: TextSpan(
              text: "R ",
              style: TextStyle(
                color: Color(0xFFFFBD4A),
                fontSize: size.width * 0.15,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: "E M I N D E R",
                  style: TextStyle(
                    color: Color(0xFFA8A8A8),
                    fontSize: size.width * 0.08,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
