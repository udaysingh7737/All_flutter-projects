import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dilog1/contactUs.dart';
import 'package:flutter_dilog1/aboutUs.dart';
import 'package:flutter_dilog1/history.dart';
import 'package:flutter_dilog1/login1.dart';
import 'package:flutter_dilog1/pages/log_test.dart';
import 'package:flutter_dilog1/singin1.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: new HomePage(),
      routes: <String, WidgetBuilder>{
        "/ht": (BuildContext context) =>
            new History1("welcome shri naam History page"),
        "/con": (BuildContext context) => new Contect1(),
        "/ab": (BuildContext context) => About1("Welcome About us page"),
        "/log": (BuildContext context) => Loginpage1(),
        "/sing": (BuildContext context) => SinginPage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {



  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final db = Firestore.instance;
String detail;
  void shoWdialog(bool isUpdate, DocumentSnapshot ds) {
    GlobalKey<FormState> formkey= GlobalKey<FormState>();
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: isUpdate ? Text("Update Detail") : Text("Add Details"),
            content: Form(
              key: formkey,
              autovalidateMode:AutovalidateMode.always,
              child: TextFormField(
                autofocus: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Datils",
                ),
                validator: (_val){
                  if(_val.isEmpty){
                    return "can't be Empty";
                  }else{
                    return null;
                  }
                },
                onChanged: (_val){
                  detail=_val;
                },
              ),
            ),
            actions: <Widget>[
              MaterialButton(
                splashColor: Colors.purpleAccent,
                onPressed: () {
                  if(isUpdate){
                    db.collection('detail').doc(ds.id).update({'detail':detail, 'time':DateTime.now()
                    });
                    Navigator.pop(context);
                  }
                  else{
                  db.collection('detail').add({'detail': detail, 'time' :DateTime.now()});
                  Navigator.pop(context);
                  }
                },
                child:isUpdate ? Text("update"): Text("Add"),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: new Scaffold(
/*        floatingActionButton: FloatingActionButton(
          onPressed:()=> shoWdialog(false,null),
          child: Icon(Icons.add),
        ),

 */
        appBar: new AppBar(
          title: new Text("Patrick Demo App"),
          elevation:
              defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.1,
        ),
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                  accountName: new Text("UDAY SINGH"),
                  accountEmail: new Text("Rupen@gmail.com"),
                  currentAccountPicture: new CircleAvatar(
                    backgroundColor: Colors.white60,
                    child: new Text("U"),
                  )),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              new ListTile(
                title: new Text("DEmo App"),
                leading: new Icon(Icons.history),
                onTap: () => Navigator.of(context).pushNamed("/ht"),
              ),
              new ListTile(
                title: new Text("Contect Us"),
                leading: new Icon(Icons.contacts),
                onTap: () => Navigator.of(context).pushNamed("/con"),
              ),
              new ListTile(
                title: new Text("RAjputana"),
                leading: Icon(Icons.shield),
                onTap: () {
                  Navigator.of(context).pushNamed("/log");
                },
              ),
              new Divider(),
              new ListTile(
                title: Text("About us !"),
                leading: Icon(Icons.perm_device_information_rounded),
                onTap: () => Navigator.of(context).pushNamed("/ab"),
              ),
              new Divider(),
              new ListTile(
                title: Text("Version 0.1"),
              ),
            ],
          ),
        ),


        body: Center(
          child: Column(
          children: <Widget>[ MaterialButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Loginpage1()));
            },splashColor: Colors.purpleAccent,
            child: Text("Start Journey"),



          ),

            FloatingActionButton(onPressed: (){})


    ])

        )),
    );
  }
}
