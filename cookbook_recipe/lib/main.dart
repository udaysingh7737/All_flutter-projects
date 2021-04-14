import 'package:cookbook_recipe/models/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/Navitem.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {


    return MultiProvider(
      providers:[
        ChangeNotifierProvider(
          create: (context)=> NavItems(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'CookBook App',
            theme: ThemeData(
              appBarTheme: AppBarTheme(color: Colors.white, elevation: 0),
              backgroundColor: Colors.white60,
              visualDensity:  VisualDensity.adaptivePlatformDensity,


            ),
            home: HomeScreen(),

          ),
        ),

      ]
    );
  }
}
