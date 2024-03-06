
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:sign_in_button/sign_in_button.dart';

class LoginService {
  /// UI
  Widget googleSignInButton(FirebaseAuth firebaseAuth) {
    return Center(child: SizedBox(
      height: 50,
      child: SignInButton(Buttons.google, text: "Sign in", onPressed: handleGoogleSignIn(firebaseAuth),),
    ),);
  }

  Widget appleSignInButton(FirebaseAuth firebaseAuth) {
    return Center(child: SizedBox(
      height: 50,
      child: SignInButton(Buttons.apple, text: "Sign in", onPressed: handleGoogleSignIn(firebaseAuth),),
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