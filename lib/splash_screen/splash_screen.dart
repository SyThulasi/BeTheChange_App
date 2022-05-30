import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:be_the_change/animated_welcome/animated_welcome_page.dart';
import 'package:be_the_change/constants.dart';

import '../login_screen/login_screen.dart';
import '../utils/custom_page_route.dart';

class SplashScreen extends StatefulWidget {

  String id =  'SplashScreen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 1),
        () => Navigator.of(context).push(
            CustomPageRoute(child: AnimatedWelcomePage(), transition: "slide left")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                kPrimaryColor,
                kPrimaryLightColor,
              ]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset(
                  "assets/images/clip.png",
                  height: 300.0,
                  width: 300.0,
                ),
                const Text(
                  "Be_The_Change",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
