import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class Contect1 extends StatefulWidget {
  @override
  _Contect1State createState() => _Contect1State();
}


class _Contect1State extends State<Contect1> {
  // ignore: deprecated_member_use
  final db= Firestore.instance;

  void showdialog(){
    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text("Add Details"),
          content: Form(
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter Datils",
              ),
            ),
          ),
        );
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: showdialog,
            child: Icon(Icons.add),
          ),
          appBar: AppBar(title: Text("Connect Ua page"),
          ),
          body: Center(
            child: Text("Insert Your Details"),
          ),
        )
    );
  }
}

