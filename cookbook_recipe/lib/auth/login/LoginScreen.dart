import 'package:cookbook_recipe/auth/login/Login_Body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(

        body:  MultiProvider(providers: [
          ChangeNotifierProvider<RegiFormProvider>.value(value: RegiFormProvider()),
        ], child: Login_Body(
          child: Column(
            children: <Widget>[

            ],
          ),
        ),
      )

        ),
      );

  }
}


class RegiFormProvider with ChangeNotifier {

  final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
}




