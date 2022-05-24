import 'package:flutter/material.dart';
import 'package:be_the_change/screen/body.dart';

class BlankScreen extends StatelessWidget {

  String id =  'BlankScreen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
