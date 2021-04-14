import 'package:flutter/material.dart';

void main() {
  runApp(MyApp1());
}

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "calculator Application",
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
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
  String result = "";
  int firstnum = 0;
  int secondnum = 0;
  String opratorperform;
  String output = "Output";
  Widget customButton(String btnval) {
    return Expanded(
        child: OutlineButton(
      onPressed: () => btnclicked(btnval),
      padding: EdgeInsets.all(20.0),
      splashColor: Colors.blueGrey,
      child: Text(
        '$btnval',
        style: TextStyle(
          fontSize: 30.0,
          fontFamily: "Cursive",
          fontWeight: FontWeight.w800,
        ),
      ),
    ));
  }

  void btnclicked(String btnval) {
    if (output == "Output")
      setState(() {
        output = btnval;
      });

    if (btnval == "C") {
      setState(() {
        output = "0";
      });

      firstnum = 0;
      secondnum = 0;
      result = "";
      opratorperform = "";
    } else if (btnval == "+" ||
        btnval == "-" ||
        btnval == "÷" ||
        btnval == "X") {
      firstnum = int.parse(output);
      result = "";
      opratorperform = btnval;
    } else if (btnval == "=") {
      secondnum = int.parse(output);
      if (opratorperform == "+") {
        result = (firstnum + secondnum).toString();
      }
      if (opratorperform == "-") {
        result = (firstnum - secondnum).toString();
      }
      if (opratorperform == "÷") {
        result = (firstnum / secondnum).toString();
      }
      if (opratorperform == "X") {
        result = (firstnum * secondnum).toString();
      }
      if (opratorperform == "%") {
        result = (firstnum / 100).toString();
      }
    } else {
      setState(() {
        result = int.parse(output + btnval).toString();
      });
    }

    setState(() {
      output = result;
    });

    if (btnval == "C") {
      setState(() {
        output = "0";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator AppLicaton"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.all(19.0),
                  child: Text(
                    "$output",
                    style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.lightBlue),
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                customButton("9"),
                customButton("8"),
                customButton("7"),
                customButton("+"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("6"),
                customButton("5"),
                customButton("4"),
                customButton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("3"),
                customButton("2"),
                customButton("1"),
                customButton("X"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("00"),
                customButton("0"),
                customButton("."),
                customButton("÷"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("C"),
                customButton("0"),
                customButton("❁"),
                customButton("="),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
