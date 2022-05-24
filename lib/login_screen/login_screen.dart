import 'package:flutter/material.dart';
import 'package:be_the_change/login_screen/body.dart';

class LoginScreen extends StatelessWidget {

  String id =  'LoginScreen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body: SafeArea(child: Body()),
    );
  }
}
