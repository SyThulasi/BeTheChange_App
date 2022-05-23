import 'package:flutter/material.dart';
import 'package:be_the_change/constants.dart';

import '../login_screen/login_screen.dart';
import '../signup_screen/signup_screen.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final VoidCallback press;
  const AlreadyHaveAnAccountCheck({
    key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don’t have an Account ? " : "Already have an Account ? ",
          style: const TextStyle(color: Colors.white),
        ),
        GestureDetector(
          onTap: () {
            if(login == true){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
            }
            else{
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
            }
            },
          child: Text(
            login ? "Sign Up" : "Sign In",
            style: const TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
