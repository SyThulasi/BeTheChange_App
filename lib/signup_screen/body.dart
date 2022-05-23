import 'package:be_the_change/componnents/already_have_an_account_acheck.dart';
import 'package:be_the_change/componnents/rounded_input_field.dart';
import 'package:be_the_change/signup_screen/social_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:be_the_change/welcome/background.dart';
import 'package:be_the_change/componnents/rounded_password_field.dart';
import 'package:be_the_change/componnents/rounded_button.dart';
import 'package:be_the_change/login_screen/login_screen.dart';
import 'package:be_the_change/screen/blank_screen.dart';

import '../constants.dart';
import 'or_divider.dart';

String? name, email, password, reTypePassword;


class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        reverse: true,
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Sign Up",
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
            SizedBox(height: size.height * 0.01),
            RoundedInputField(
              hintText: "Name",
              onChanged: (value) {
                name = value;
              },
              icon: Icons.person,
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
                email = value;
              },
              icon: Icons.mail,
            ),
            RoundedPasswordField(
              onChanged: (value) {
                password = value;
              },
              key: null,
              password_word: 'Password',
            ),
            RoundedPasswordField(
              onChanged: (value) {
                reTypePassword = value;
              },
              key: null,
              password_word: 'Retype password',
            ),
            SizedBox(height: size.height * 0.01),
            RoundedButton(
              text: "SIGN UP",
              color: kPrimaryColor,
              press: () {
                print("Name : "+name!+" "+email!+" "+password!);
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
            SizedBox(height: size.height * 0.01),
            AlreadyHaveAnAccountCheck(
              login: false,
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
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},

                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
