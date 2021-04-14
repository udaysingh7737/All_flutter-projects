import 'dart:async';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(myApp3());
}

class myApp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "splash screen",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: homepage(),
    );
  }
}

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  void initState() {
    super.initState();
    debugPrint("Started splash screen");
    Timer(Duration(seconds: 5), finished);
    Timer(Duration(seconds: 5), changer);
  }

  String result = "";
  String c1 = "white";

  void finished() {
    debugPrint("finished..........\nwe are done!..");
    setState(() {
      result = "welcome!! my App";
    });
  }

  void changer() {
    setState(() {
      c1 = "green";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[300],
      appBar: AppBar(
        title: Text(
          "Splash Screen",
        ),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "splash \nScreen $c1",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontFamily: "Cursive",
                      fontSize: 30.0,
                      color: Colors.white),
                ),
              ],
            ),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
            Text(
              "$result",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontFamily: "Cursive",
                  fontSize: 30.0,
                  color: Colors.white),
            ),
          ]),
    );
  }
}
