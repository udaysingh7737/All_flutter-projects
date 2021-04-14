import 'package:flutter/material.dart';
import 'main.dart';

class secondScreen extends StatefulWidget {
  @override
  _secondScreenState createState() => _secondScreenState();
}

class _secondScreenState extends State<secondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "WelCome to Second ",
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
                    Navigator.pushNamed(context, '/third');
                  },
                  color: Colors.lime,
                  splashColor: Colors.blue,
                  child: Text(
                    "Switch to 3rd Screen",
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
