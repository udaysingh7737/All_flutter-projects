import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(child: Container(
              decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/pic4.png",
              )
              )
            ),)
            ),

            Text("Create & Manage Notes"),
            ElevatedButton(onPressed: () {}, child: Row(
              children: [
                Text("Continue with Uday")
              ],
            ))
          ],
        ),
      ),
    );
  }
}
