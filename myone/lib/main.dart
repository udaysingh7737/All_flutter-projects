import 'package:flutter/material.dart';

void main() {
  runApp(myApp1());
}

class myApp1 extends StatefulWidget {
  @override
  _myApp1State createState() => _myApp1State();
}

class _myApp1State extends State<myApp1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                maxLength: 16,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20.0,
                ),
              ),
            )
          ]),
    );
  }
}
