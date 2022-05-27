import 'package:be_the_change/login_screen/login_screen.dart';
import 'package:be_the_change/screen/blank_screen.dart';
import 'package:be_the_change/sign_Out_Page/sign_out.dart';
import 'package:be_the_change/signup_screen/signup_screen.dart';
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
      initialRoute: SplashScreen().id,
      routes: {
        SplashScreen().id : (context) =>  SplashScreen(),
        AnimatedWelcomePage().id: (context) =>  AnimatedWelcomePage(),
        WelcomeScreen().id : (context) => WelcomeScreen(),
        LoginScreen().id : (context) => LoginScreen(),
        SignUpScreen().id : (context) => SignUpScreen(),
        BlankScreen().id : (context) => BlankScreen(),
        SignOutScreen().id : (context) => SignOutScreen(),
      },
    );
  }
}
