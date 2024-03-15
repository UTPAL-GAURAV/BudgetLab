
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../HomeModule/UI/homePage_screen.dart';
import '../color_manager.dart';

class LoginService {
  /// UI
  Widget googleSignInButton(FirebaseAuth firebaseAuth) {
    return Center(child: SizedBox(
      height: 50,
      child: FloatingActionButton.extended(
        icon: Image.asset('assets/images/icons/google.png', height: 22,),
        label: Text("Sign in", style: TextStyle(color: Colors.black, fontSize: 20)),
        backgroundColor: Colors.white,
        onPressed: () {
          handleGoogleSignIn(firebaseAuth);
        },
      ),
    ),);
  }

  Widget appleSignInButton(FirebaseAuth firebaseAuth) {
    return Center(child: SizedBox(
      height: 50,
      child: FloatingActionButton.extended(
        icon: Icon(FontAwesomeIcons.apple),
        label: Text("Sign in", style: TextStyle(color: Colors.black, fontSize: 20)),
        backgroundColor: Colors.white,
        onPressed: () {
          handleGoogleSignIn(firebaseAuth);
        },
      ),
    ),);
  }

  /// Services
   handleGoogleSignIn(FirebaseAuth firebaseAuth) {
    try {
      GoogleAuthProvider _googleAuthProvider = GoogleAuthProvider();
      firebaseAuth.signInWithProvider(_googleAuthProvider);
    } catch (error) {
      //TODO: Show failed toast message and send logs to firebase with mobile data
      print(error);
    }
  }

}