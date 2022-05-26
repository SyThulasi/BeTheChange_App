import 'package:be_the_change/utils/showSnackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../signup_screen/userModel.dart';

class FirebaseAuthMethods {

  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);

  //Email sign up
  Future<void> signupWithEmail({
    required String email,
    required String password,
    required String name,
    required BuildContext context,
  }) async{
     try{
       await _auth.createUserWithEmailAndPassword(email: email, password: password);
       postDetailsToFirestore(name);
       await sendEmailVerification(context);
     }
     on FirebaseAuthException catch (e){
       print(e.message);
        showSnackBar(context, e.message!);
     }
  }

  Future<void> logInWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if(!_auth.currentUser!.emailVerified){
        await sendEmailVerification(context);
      }
    }
    on FirebaseAuthException catch (e){
      print(e.message);
      showSnackBar(context, e.message!);
    }
  }

  Future<void>sendEmailVerification(BuildContext context) async {
    try{
      _auth.currentUser!.sendEmailVerification();
        showSnackBar(context, "Email Verification sent");
    }
    on FirebaseAuthException catch (e){
      showSnackBar(context, e.message!);
    }
  }
  postDetailsToFirestore(String name) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    userModel.email = user!.email;
    userModel.name = name;
    userModel.userID = user.uid;

    await firebaseFirestore
        .collection("User")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account Create Sucessfully");
  }
}