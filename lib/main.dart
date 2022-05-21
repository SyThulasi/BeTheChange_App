import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:be_the_change/welcome/welcome_screen.dart';
import 'package:be_the_change/animated_welcome/animated_welcome_page.dart';
import 'package:be_the_change/splash_screen/splash_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: const Color(0xFF0D1118),
        //scaffoldBackgroundColor: Colors.white,
      ),
      home: SplashScreen(),
    );
  }
}
