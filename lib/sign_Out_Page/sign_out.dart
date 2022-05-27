import 'package:flutter/material.dart';
import 'package:be_the_change/sign_Out_Page/body.dart';

class SignOutScreen extends StatelessWidget {

  String id =  'GoogleLoginScreen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body: SafeArea(child: Body()),
    );
  }
}