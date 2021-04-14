import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(MyJsonApp());
}

class MyJsonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "JSON in flutter",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("JSON in Flutter"),
        ),
        backgroundColor: Colors.blueGrey[200],
        body: FutureBuilder(
            future:
                DefaultAssetBundle.of(context).loadString("asset/data.json"),
            builder: (context, snapshot) {
              var mydata = json.decode(snapshot.data.toString());
              if (mydata == null) {
                return Center(
                    child: Row(
                  children: <Widget>[
                    Text(
                      mydata["loading"],
                      style: TextStyle(fontSize: 30.0, color: Colors.red),
                    ),
                    Text(
                      mydata["class"],
                      style: TextStyle(fontSize: 30.0, color: Colors.amber),
                    ),
                  ],
                ));
              } else {
                return Center(
                    child: Row(
                  children: <Widget>[
                    Text(
                      mydata[0]["name"],
                      style: TextStyle(fontSize: 30.0, color: Colors.red),
                    ),
                    Text(
                      mydata[1]["class"],
                      style:
                          TextStyle(fontSize: 35.0, color: Colors.amber[800]),
                    ),
                  ],
                ));
              }
            }));
  }
}
