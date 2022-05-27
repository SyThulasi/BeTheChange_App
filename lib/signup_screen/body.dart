import 'package:be_the_change/componnents/already_have_an_account_acheck.dart';
import 'package:be_the_change/componnents/rounded_input_field.dart';
import 'package:be_the_change/services/firebase_auth_methods.dart';
import 'package:be_the_change/sign_Out_Page/sign_out.dart';
import 'package:be_the_change/signup_screen/social_icon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:be_the_change/welcome/background.dart';
import 'package:be_the_change/componnents/rounded_password_field.dart';
import 'package:be_the_change/componnents/rounded_button.dart';
import 'package:be_the_change/screen/blank_screen.dart';
import 'package:be_the_change/utils/showSnackbar.dart';

import '../constants.dart';
import 'or_divider.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _auth = FirebaseAuth.instance;
  String? name, email, password, reTypePassword;

  void signUpUser() async{
    FirebaseAuthMethods(FirebaseAuth.instance).signupWithEmail(email: email!, password: password!,context: context, name: name!);
  }


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
              press: (){
                if (password == reTypePassword){
                  signUpUser();
                }
                else{
                  showSnackBar(context, "Password doesn't match!");
                }
              },
              length: size.width * 0.4,
            ),
            SizedBox(height: size.height * 0.01),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {},
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // SocalIcon(
                //   iconSrc: "assets/icons/facebook.svg",
                //   press: () {
                //     Navigator.pushNamed(context, BlankScreen().id);
                //   },
                //
                // ),
                // SocalIcon(
                //   iconSrc: "assets/icons/twitter.svg",
                //   press: () {
                //     Navigator.pushNamed(context, BlankScreen().id);
                //   },
                // ),
                SocalIcon(
                  iconSrc: "assets/icons/google.svg",
                  press: () {
                    FirebaseAuthMethods(FirebaseAuth.instance).signInWithGoogle(context);
                    Navigator.pushNamed(context, SignOutScreen().id);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
