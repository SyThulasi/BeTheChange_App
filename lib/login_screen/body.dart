import 'package:be_the_change/componnents/already_have_an_account_acheck.dart';
import 'package:be_the_change/componnents/rounded_input_field.dart';
import 'package:be_the_change/screen/blank_screen.dart';
import 'package:be_the_change/signup_screen/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:be_the_change/welcome/background.dart';
import 'package:be_the_change/componnents/rounded_password_field.dart';
import 'package:be_the_change/componnents/rounded_button.dart';
import 'package:be_the_change/login_screen/login_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../constants.dart';


class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
 _BodyState createState() => _BodyState();
}
class _BodyState extends State<Body> {

  String? emailID;
  String? password;
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

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
            onChanged: (value) {
              emailID = value;
              validator:
                  (value) {
                if (value!.isEmpty) {
                  return ("Please Enter your Email");
                }
                if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                    .hasMatch(value)) {
                  return ("Please Enter a valid email");
                }
                return null;
              };
            },
            icon: Icons.mail,
          ),
          RoundedPasswordField(
            onChanged: (value) {
              password = value;
              validator:
                  (value) {
                RegExp regex = new RegExp(r'^.{6,}$');
                if (value!.isEmpty) {
                  return ("Password is required for login");
                }
                if (!regex.hasMatch(value)) {
                  return ("Enter Valid Password(Min. 6 Character)");
                }
              };
            },
            key: null,
            password_word: 'Password',
          ),
          SizedBox(height: size.height * 0.02),
          RoundedButton(
            text: "LOGIN",
            color: kPrimaryColor,
            press: () {
              print("***************************************************");
              print(emailID);
              print(password);
              Navigator.pushNamed(context, BlankScreen().id);
            },
            length: size.width * 0.4,
          ),
          SizedBox(height: size.height * 0.02),
          AlreadyHaveAnAccountCheck(
            press: () {},
          ),
        ],
      ),
    ),  ///////////////

    );
  }
}