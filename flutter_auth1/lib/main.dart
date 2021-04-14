import 'package:flutter/material.dart';

import 'package:flutter_auth1/screen/auth_1/auth.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return LitAuthInit(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthScreen(),
        ),
    );


  }
}
