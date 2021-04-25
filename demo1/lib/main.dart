import 'package:demo1/BgImage.dart';
import 'package:demo1/NewBody.dart';
import 'package:demo1/searchDelegets1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(myapp1());
}

class myapp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(routes: {
      "/fon": (context)=> BgImage1(),
    },
        debugShowCheckedModeBanner: false,
        title: "sample app",
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: MystatefullWidget());
  }
}

class MystatefullWidget extends StatefulWidget {
  const MystatefullWidget({
    Key key,
  }) : super(key: key);

  @override
  _MystatefullWidgetState createState() => _MystatefullWidgetState();
}

class _MystatefullWidgetState extends State<MystatefullWidget> {
  TextEditingController _nameEditController =TextEditingController();
  TextEditingController _emaileditController = TextEditingController();

  String myname= "Uday singh";
  String email= "DemoMail@email.com";
  @override
  Widget build(BuildContext context) {
    return Scaffold(drawer: Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: Image.asset("assets/images/cs.jpg"),

            accountEmail: Text(email),
            accountName: Text(myname),
          )
        ],
      ),
    ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.autorenew),
        onPressed: (){

          setState(() {
            email = _emaileditController.text;
            myname = _nameEditController.text;

          });

        },
      ),

      appBar: AppBar(
        title: Text(
          "sample Application",
          style: TextStyle(fontSize: 28.0),
        ),

        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              })
        ],
      ),

      body: NewBody1(
          myname: myname,
          nameEditController: _nameEditController,
          emaileditController: _emaileditController
      ),
    );
  }
}


