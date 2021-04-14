import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dilog1/screen/auth_1/auth.dart';
class Home1k extends StatefulWidget {
  @override
  _Home1kState createState() => _Home1kState();
}

class _Home1kState extends State<Home1k> {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,


      home: AuthScreen(),




    );



  }
}
