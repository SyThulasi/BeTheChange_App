import 'package:be_the_change/componnents/already_have_an_account_acheck.dart';
import 'package:be_the_change/componnents/rounded_input_field.dart';
import 'package:be_the_change/screen/blank_screen.dart';
import 'package:flutter/material.dart';
import 'package:be_the_change/welcome/background.dart';
import 'package:be_the_change/componnents/rounded_password_field.dart';
import 'package:be_the_change/componnents/rounded_button.dart';
import 'package:be_the_change/login_screen/login_screen.dart';

import '../constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "Log in",
            style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
                color: Colors.teal),
          ),
          SizedBox(height: size.height * 0.02),
          Positioned(
            child: Image.asset(
              "assets/images/clip.png",
              width: size.width * 0.25,
            ),
          ),
          SizedBox(height: size.height * 0.02),
          RoundedInputField(
            hintText: "Your Email",
            onChanged: (value) {},
            icon: Icons.mail,
          ),
          RoundedPasswordField(
            onChanged: (value) {},
            key: null,
            password_word: 'Password',
          ),
          SizedBox(height: size.height * 0.02),
          RoundedButton(
            text: "LOGIN",
            color: kPrimaryColor,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const BlankScreen();
                  },
                ),
              );
            },
            length: size.width * 0.4,
          ),
          SizedBox(height: size.height * 0.02),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
