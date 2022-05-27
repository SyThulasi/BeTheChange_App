import 'package:be_the_change/utils/showSnackbar.dart';
import 'package:be_the_change/welcome/welcome_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../sign_Out_Page/sign_out.dart';
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
       Navigator.pushNamed(context, SignOutScreen().id);
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
      Navigator.pushNamed(context, SignOutScreen().id);
    }
    on FirebaseAuthException catch (e){
      print(e.message);
      showSnackBar(context, e.message!);
    }
  }

  // send email verification function
  Future<void>sendEmailVerification(BuildContext context) async {
    try{
      _auth.currentUser!.sendEmailVerification();
        showSnackBar(context, "Email Verification sent");
    }
    on FirebaseAuthException catch (e){
      showSnackBar(context, e.message!);
    }
  }

  // Function for post the details of the user to firebase
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
  // Signout function
  Future<void> SignOut(BuildContext context) async{
    try{
      await _auth.signOut();
      Navigator.pushNamed(context, WelcomeScreen().id);
    }
    on FirebaseAuthException catch (e){
      showSnackBar(context, e.message!);
    }
  }
}