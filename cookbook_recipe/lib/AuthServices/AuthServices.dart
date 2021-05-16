

import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';



class AuthServices {

  final FirebaseAuth _authServices = FirebaseAuth.instance;

  // google Sign In process
  Future signinGoogleAuth() async{
    try{
      final GoogleSignInAccount googleUser= await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final GoogleAuthCredential credential =
      GoogleAuthProvider.credential(accessToken: googleAuth.accessToken,idToken: googleAuth.idToken);

      await FirebaseAuth.instance.signInWithCredential(credential).then((value) =>
          FirebaseFirestore.instance.collection('userDetails').doc(value.user.uid).set({"email": value.user.email})
              .then((value) => print('hello'))
      );
      return 0;
    }on FirebaseAuthException catch(e){
      print(e.toString());
      return e.toString();
    }
  }

  // Reset Password method
  Future resetPassword(String email) async{
    final String emailAddress = email;
    try {
      await _authServices.sendPasswordResetEmail(email: emailAddress);

      print("email just send it........************");
      return 0;

    }on FirebaseAuthException catch(e) {
      if(e.code == 'user-not-found'){
        print('There is no user record corresponding to this identifier. The user may have been deleted.');
        return 'user-not-found';
      }if(e.code == 'too-many-requests'){
        print('We have blocked all requests from this device due to unusual activity. Try again later.');
        return 'too-many-requests';

      }else {
        print(e.toString());
        return e.toString();
      }

    }
  }

}