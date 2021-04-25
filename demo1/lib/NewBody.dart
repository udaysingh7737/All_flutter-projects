import 'dart:convert';

import 'package:demo1/BgImage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as httpp;

class NewBody1 extends StatefulWidget {
  const NewBody1({
    Key key,
    @required this.myname,
    @required TextEditingController nameEditController,
    @required TextEditingController emaileditController,
  }) : _nameEditController = nameEditController, _emaileditController = emaileditController, super(key: key);

  final String myname;
  final TextEditingController _nameEditController;
  final TextEditingController _emaileditController;

  @override
  _NewBody1State createState() => _NewBody1State();
}

class _NewBody1State extends State<NewBody1> {
  var urlApi= "https://jsonplaceholder.typicode.com/photos";
  var data;

  @override
  void initState(){
    super.initState();
    getData();
  }

  getData() async{
    var response = await httpp.get(Uri.https('jsonplaceholder.typicode.com', 'photos/'));
    print(response.body);
    data = jsonDecode(response.body);
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child:
          data != null
              ? Stack(
                children: <Widget>[BgImage1(),
                  GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2) ,
            itemBuilder: (context,index){
                    return Padding(padding: const EdgeInsets.all(16.0),
                        child: ListTile(
                      title: Text(data[index]['title']),
                      subtitle: Align(alignment:Alignment.bottomRight,child: Text("ID: ${data[index]['id']}",style: TextStyle(color: Colors.blue),)),
                      leading: Image.network(data[index]['url']),
                    ),);
                  },
                    itemCount: data.length,),
                ],
              )
              :Center(
              child: CircularProgressIndicator(),),

          );

  }
}
