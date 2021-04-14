import 'package:flutter/material.dart';
import 'main.dart';
import 'second.dart';

class third extends StatefulWidget {
  @override
  _thirdState createState() => _thirdState();
}

class _thirdState extends State<third> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Third Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "WelCome to 3rd",
                style: TextStyle(
                    fontSize: 35.0,
                    color: Colors.red,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  color: Colors.red,
                  splashColor: Colors.blue,
                  child: Text(
                    "Switch to Home",
                    style: TextStyle(fontSize: 25.0),
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/second');
                  },
                  color: Colors.orange,
                  splashColor: Colors.blue,
                  child: Text(
                    "Switch to 2nd",
                    style: TextStyle(fontSize: 25.0),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
