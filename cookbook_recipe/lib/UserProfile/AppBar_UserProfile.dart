import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  final icon = CupertinoIcons.moon_stars;

  return AppBar(
    leading: InkWell(
        child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    actions: <Widget>[
      IconButton(
        onPressed: (){},
        icon: Icon(icon,color: Colors.black,),
      ),

    ],
  );
}