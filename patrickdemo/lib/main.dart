import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:patrickdemo/pages/loginpage.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:patrickdemo/pages/signuppage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.purple,
        primarySwatch: Colors.purple,
        accentColor: Colors.purple,
      ),
      home: HomePage(),
      routes: <String, WidgetBuilder>{



        "/log": (BuildContext context) => Loginpage1(),
        "/sing": (BuildContext context) => SingUpPage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: new AppBar(
          title: new Text("Shree Radhey NAAM BANk"),
          elevation:
          defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.1,
        ),

        body: Center(
          child: MaterialButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Loginpage1()));
            },
            child: Text("Start Journey"),
          ),
        ),


      ),
    );
  }
}


