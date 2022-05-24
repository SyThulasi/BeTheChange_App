import 'package:flutter/material.dart';
import 'package:be_the_change/signup_screen/body.dart';

class SignUpScreen extends StatelessWidget {
  String id =  'AnimatedWelcomePage';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Body()),
    );
  }
}
