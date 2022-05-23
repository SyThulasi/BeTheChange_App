import 'package:be_the_change/componnents/already_have_an_account_acheck.dart';
import 'package:be_the_change/componnents/rounded_input_field.dart';
import 'package:be_the_change/screen/blank_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:be_the_change/welcome/background.dart';
import 'package:be_the_change/componnents/rounded_password_field.dart';
import 'package:be_the_change/componnents/rounded_button.dart';
import 'package:be_the_change/login_screen/login_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../constants.dart';

// firebase
final _auth = FirebaseAuth.instance;
String? emailID;
String? password;
final _formKey = GlobalKey<FormState>();

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
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
              signIn(emailID!, password!);
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


// login function
  void signIn(String email, String password) async {

    String? errorMessage;
    print("1111111111111111111111111111111111111111111111111");
    print(email + password);
    if (_formKey.currentState!.validate()) {

      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) =>
        {
          Fluttertoast.showToast(msg: "Login Successful"),

        });

      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }

  }
}

