import 'package:be_the_change/utils/showSnackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthMethods {

  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);

  //Email sign up
  Future<void> signupWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async{
     try{
       print("***************************************");
       await _auth.createUserWithEmailAndPassword(email: email, password: password);
       print("***************************************2");
     }
     on FirebaseAuthException catch (e){
       print("***************************************1");
       print(e.message);
       if (e.code == 'weak-password') {
         print('The password provided is too weak.');
       } else if (e.code == 'email-already-in-use') {
         print('The account already exists for that email.');
       }
        showSnackBar(context, e.message!);
     }
  }
}