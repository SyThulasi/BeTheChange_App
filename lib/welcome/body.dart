import 'package:animate_do/animate_do.dart';
import 'package:be_the_change/constants.dart';
import 'package:be_the_change/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:be_the_change/welcome/background.dart';
import 'package:be_the_change/componnents/rounded_button.dart';
import 'package:be_the_change/signup_screen/signup_screen.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FadeInDown(
            delay: Duration(milliseconds: 400),
            duration: Duration(milliseconds: 400),
            child: const Text(
              "Welcome",
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
            ),
          ),
          SizedBox(height: size.height * 0.01),
          FadeInDown(
            delay: Duration(milliseconds: 400),
            duration: Duration(milliseconds: 400),
            child: const Text(
              "To",
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey),
            ),
          ),
          SizedBox(height: size.height * 0.01),
          FadeInDown(
            delay: Duration(milliseconds: 200),
            duration: Duration(milliseconds: 200),
            child: const Text(
              "Be_The_Change",
              style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal),
            ),
          ),
          SizedBox(height: size.height * 0.05),
          // SvgPicture.asset(
          //   "assets/icons/chat.svg",
          //   height: size.height * 0.4,
          // ),
          FadeInDown(
            delay: Duration(milliseconds: 300),
            duration: Duration(milliseconds: 300),
            child: Positioned(
              child: Image.asset(
                "assets/images/clip.png",
                width: size.width * 0.4,
              ),
            ),
          ),
          SizedBox(height: size.height * 0.05),
          FadeInDown(
            delay: Duration(milliseconds: 200),
            duration: Duration(milliseconds: 200),
            child: RoundedButton(
              text: "Log In",
              length: size.width * 0.4,
              press: () {
                Navigator.pushNamed(context, LoginScreen().id);
              },
              color: kPrimaryColor,
            ),
          ),
          FadeInDown(
            delay: Duration(milliseconds: 200),
            duration: Duration(milliseconds: 200),
            child: RoundedButton(
              text: "Sign Up",
              length: size.width * 0.4,
              color: kPrimaryColor,
              press: () {
                Navigator.pushNamed(context, SignUpScreen().id);
              },
            ),
          ),
        ],
      ),
    );
  }
}
