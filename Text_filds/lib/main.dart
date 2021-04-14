import 'package:flutter/material.dart';

void main() {
  runApp(myApp2());
}

class myApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "text fileds",
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
  String myvar;
  String displayvar = "";
  void showtext() {
    setState(() {
      displayvar = myvar;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text(
            "Text fiels Example",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "welcome! $displayvar",
              style: TextStyle(fontSize: 35.0, color: Colors.lightBlue),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: (text) {
                  myvar = text;
                },
                autocorrect: true,
                maxLines: 1,
                maxLength: 30,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle),
                    labelText: "username",
                    border: OutlineInputBorder()),
                style: TextStyle(fontSize: 25.0, color: Colors.blue),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'this filed requird';
                  }
                  return null;
                },
                obscureText: true,
                autocorrect: true,
                maxLines: 1,
                maxLength: 16,
                decoration: InputDecoration(
                    hintText: "Enter your Password",
                    labelText: "password",
                    helperText: "Lenth between 8-16",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.vpn_key)),
                style: TextStyle(fontSize: 25.0, color: Colors.blue),
              ),
            ),
            /*
        
        TextField(
          autocorrect: true,
          maxLines: 1,
          maxLength: 200,
          decoration: InputDecoration(
            hintText: "username",
          ),
          style: TextStyle(fontSize: 25.0, color: Colors.blue),
        ),
        TextField(
          autocorrect: true,
          maxLines: 1,
          maxLength: 20,
          decoration: InputDecoration(
            helperText: "username",
          ),
          style: TextStyle(fontSize: 25.0, color: Colors.blue),
        ),

        ///hhfvdhgjkfgju */
            RaisedButton(
              splashColor: Colors.green,
              onPressed: showtext,
              child: Text(
                "Submit",
                style: TextStyle(color: Colors.red),
              ),
            )
          ],
        ));
  }
}
