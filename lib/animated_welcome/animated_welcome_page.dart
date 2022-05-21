import 'package:be_the_change/welcome/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:be_the_change/constants.dart';
import 'package:be_the_change/animated_welcome/background.dart';

class AnimatedWelcomePage extends StatefulWidget {
  const AnimatedWelcomePage({Key? key}) : super(key: key);

  @override
  _AnimatedWelcomePageState createState() => _AnimatedWelcomePageState();
}

class _AnimatedWelcomePageState extends State<AnimatedWelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1118),
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 50),
            FadeInRight(
              duration: const Duration(microseconds: 750),
              // child: Image.network(
              //   'https://cdn.dribbble.com/users/2859475/screenshots/9841599/media/2d5bc73c42245d49f49db16343f69a64.gif',
              //   fit: BoxFit.cover,
              // ),
              child: Image.asset(
                "assets/images/globe.gif",
                fit: BoxFit.cover,
              ),
            ),
            FadeInUp(
              child: Container(
                padding: const EdgeInsets.only(
                    left: 50, top: 40, right: 20, bottom: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: kPrimaryColor.withOpacity(0.2),
                      offset: const Offset(0, -10),
                      blurRadius: 30,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeInUp(
                      duration: const Duration(milliseconds: 1000),
                      delay: const Duration(milliseconds: 1000),
                      from: 50,
                      child: const Text(
                        'Let\'s start the journey for change \nthe world.',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    FadeInUp(
                      duration: const Duration(milliseconds: 1000),
                      delay: const Duration(milliseconds: 1000),
                      from: 60,
                      child: Text(
                        'And save the world.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade300,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    SizedBox(height: 7),
                    // RoundedButton(
                    //   text: 'Start',
                    //   press: () {},
                    //   length: 200.0,
                    //   color: Colors.grey,
                    // )
                    FadeInUp(
                      duration: const Duration(milliseconds: 1000),
                      delay: const Duration(milliseconds: 1000),
                      from: 50,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: () {
                            // reload the page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const WelcomeScreen();
                                },
                              ),
                            );
                          },
                          child: const Text(
                            'Start >>',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF0D1118),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
