import 'package:flutter/material.dart';

void main() {
  runApp(myapp());
}

class myapp extends StatefulWidget {
  @override
  _myappState createState() => _myappState();
}

class _myappState extends State<myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      title: "Satteful",
      home: homepage(),
    );
  }
}

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  int datatochange = 0;

  void increment() {
    setState(() {
      datatochange += 1;
    });
  }

  void decrement() {
    setState(() {
      datatochange -= 1;
    });
  }

  void squre() {
    setState(() {
      datatochange *= datatochange;
    });
  }

  void allclear() {
    setState(() {
      datatochange = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "appbar",
      )),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //////********************incremaen button*********************** */
              RaisedButton(
                onPressed: decrement,
                splashColor: Colors.orange,
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                child: Text(
                  "Decrement --",
                  style: TextStyle(fontSize: 24.0, color: Colors.white),
                ),
                color: Colors.cyan[200],
              ),
              Text(
                "$datatochange",
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[800],
                ),
              ),
              //////********************incremaen button*********************** */
              RaisedButton(
                onPressed: increment,
                splashColor: Colors.orange,
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                child: Text(
                  "Increment ++",
                  style: TextStyle(fontSize: 24.0, color: Colors.white),
                ),
                color: Colors.cyan[200],
              ),
//******************multi button***************************** */

              MaterialButton(
                onPressed: squre,
                color: Colors.green,
                splashColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                child: Text(
                  "squre --",
                  style: TextStyle(fontSize: 24.0, color: Colors.white),
                ),
              ),
              // cleare button******************************
              MaterialButton(
                onPressed: allclear,
                color: Colors.green,
                splashColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                child: Text(
                  "All clear",
                  style: TextStyle(fontSize: 24.0, color: Colors.white),
                ),
              )
            ]),
      ),
    );
  }
}
