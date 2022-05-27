import 'package:be_the_change/services/firebase_auth_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:be_the_change/welcome/background.dart';
import '../componnents/rounded_button.dart';
import '../constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Background(
        child: SingleChildScrollView(
        reverse: true,
        padding: const EdgeInsets.all(15),
    child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "Be_The_Change",
            style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
                color: Colors.teal),
          ),
          SizedBox(height: size.height * 0.05),
          Positioned(
            child: Image.asset(
              "assets/images/clip.png",
              width: size.width * 0.25,
            ),
          ),
          SizedBox(height: size.height * 0.1),
          const Text(
            "The Key to greener planet",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          SizedBox(height: size.height * 0.01),
          const Text(
            "is in your hand",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          SizedBox(height: size.height * 0.1),
          RoundedButton(
            text: "LOG OUT",
            color: kPrimaryColor,
            press: () {
              FirebaseAuthMethods(FirebaseAuth.instance).SignOut(context);
            },
            length: size.width * 0.4,
          ),
          SizedBox(height: size.height * 0.02),
        ],
    ),
        ),
    );
  }
}
