import 'package:be_the_change/utils/showSnackbar.dart';
import 'package:be_the_change/welcome/welcome_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../sign_Out_Page/sign_out.dart';
import '../signup_screen/userModel.dart';
import '../utils/custom_page_route.dart';

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
       Navigator.of(context).push(
           CustomPageRoute(child: SignOutScreen(), transition: "slide left"));
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
      Navigator.of(context).push(
          CustomPageRoute(child: SignOutScreen(), transition: "slide left"));
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
      Navigator.of(context).push(
          CustomPageRoute(child: WelcomeScreen(), transition: "slide left"));
    }
    on FirebaseAuthException catch (e){
      showSnackBar(context, e.message!);
    }
  }

  // GOOGLE SIGN IN
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      if (kIsWeb) {
        GoogleAuthProvider googleProvider = GoogleAuthProvider();

        googleProvider
            .addScope('https://www.googleapis.com/auth/contacts.readonly');

        await _auth.signInWithPopup(googleProvider);
      } else {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

        final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

        if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
          // Create a new credential
          final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth?.accessToken,
            idToken: googleAuth?.idToken,
          );
          UserCredential userCredential =
          await _auth.signInWithCredential(credential);

          // if you want to do specific task like storing information in firestore
          // only for new users using google sign in (since there are no two options
          // for google sign in and google sign up, only one as of now),
          // do the following:

          // if (userCredential.user != null) {
          //   if (userCredential.additionalUserInfo!.isNewUser) {}
          // }
        }
      }
      Navigator.of(context).push(
          CustomPageRoute(child: SignOutScreen(), transition: "slide left"));
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Displaying the error message
    }
  }
}