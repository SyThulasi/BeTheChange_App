import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:be_the_change/welcome/welcome_screen.dart';
import 'package:be_the_change/animated_welcome/animated_welcome_page.dart';
import 'package:be_the_change/splash_screen/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

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
