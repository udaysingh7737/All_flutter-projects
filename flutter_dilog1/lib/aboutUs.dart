import 'package:flutter/material.dart';

class About1 extends StatelessWidget {
  final String title;
  About1(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About Us")),

      body: new Center(
        child: Text("welcome to Shree Radhey Naam Bank ,in this bank Shree Radhey Naam is "),

      ),
    );
  }
}
