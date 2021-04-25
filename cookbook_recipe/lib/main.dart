
import 'package:cookbook_recipe/models/home_screen.dart';
import 'package:cookbook_recipe/utils/Util_Constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/Navitem.dart';

Future main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Util_Constents.preferences = await SharedPreferences.getInstance();
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

        ),



        Provider<String>(
            create: (context) => "Uday singh",
        ),
        Provider<int>(create: (_) => 555),


      ],
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
    );
  }
}


