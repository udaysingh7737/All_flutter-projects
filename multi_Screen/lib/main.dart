import 'package:flutter/material.dart';
import 'package:multi_Screen/third.dart';
import 'second.dart';

void main() {
  runApp(myApp3());
}

class myApp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/second': (context) => secondScreen(),
        '/third': (context) => third(),
        '/home': (context) => myHomePage(),
      },
      title: "Multi Screen",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: myHomePage(),
    );
  }
}

class myHomePage extends StatefulWidget {
  @override
  _myHomePageState createState() => _myHomePageState();
}

class _myHomePageState extends State<myHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MULTI Screen",
          style: TextStyle(
              color: Colors.black, fontFamily: "Cursive", fontSize: 25.0),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "WelCome to Home",
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
                    Navigator.pushNamed(context, '/second');
                  },
                  color: Colors.red,
                  splashColor: Colors.blue,
                  child: Text(
                    "Switch to 2nd",
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
                  color: Colors.green,
                  splashColor: Colors.blue,
                  child: Text(
                    "Switch to 3rd",
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
