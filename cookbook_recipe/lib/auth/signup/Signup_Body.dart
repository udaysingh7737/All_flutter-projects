import 'package:cookbook_recipe/Another_auth/Sing_Up12.dart';
import 'package:cookbook_recipe/auth/Auth_Body.dart';
import 'package:cookbook_recipe/auth/Screen_Function/screenfunction.dart';
import 'package:cookbook_recipe/auth/background.dart';
import 'package:cookbook_recipe/auth/login/LoginScreen.dart';
import 'package:cookbook_recipe/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Signup_Body extends StatelessWidget {
  final Widget child;

  const Signup_Body({Key key,
    @required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: size.height*0.03,),
          Text("Sign Up To प्रसादम् !",
            style: TextStyle(
                fontFamily: "cursive",
                fontWeight: FontWeight.bold,
                fontSize: 30,
            ),
          ),
          
          SvgPicture.asset("assets/icons/signup.svg",
            height: size.height*0.35,
          ),

          TextFieldContainer_Signup(child: TextFormField(
            maxLines: 1,
            autocorrect: true,

            onChanged: (value){},
            decoration: InputDecoration(
              icon: Icon(
                Icons.person,
                color: Color(0xFFA336F8),
              ),
              hintText: "Your Email",
              border: InputBorder.none,
            ),
          ),
          ),

          TextFieldContainer_Signup(child: TextFormField(

            maxLines: 1,
            obscureText: true,

            onChanged: (value){},
            decoration: InputDecoration(
              icon: Icon(
                Icons.lock,
                color: Color(0xFFA336F8),
              ),
              hintText: "Password",
              border: InputBorder.none,
              suffixIcon: Icon(Icons.visibility,color: Color(0xFFA336F8))
            ),
          ),
          ),

          RoundedButton(text: "Login",
          color: kPrimaryColor2,
           press: (){},
           ),
          SizedBox(height: size.height*0.03,),
          Row(mainAxisAlignment: MainAxisAlignment.center,

             children: <Widget>[
               Text("Already Have Account !",
                style: TextStyle(color: Color(0xFFA336F8),),
             ),
            InkWell(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context){
                      return LoginScreen();
                    }));
              },
               child: Text("Log In", style: TextStyle(fontWeight: FontWeight.bold, color: Color(
                  0xFF711DB8)),)
          ),

        ],
      ),

          OrDivider(),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              SocialIcon( iconSrc: "assets/icons/google-plus.svg",
                press: () {
                  Navigator.push(
                      context, MaterialPageRoute(
                      builder: (context) {return Sing_up12();}
                  ));
                },
              ),
            ],
          ),
          SizedBox(height: size.height *0.03,),
          child,
     ]
      ),

    ),);
  }
}

class TextFieldContainer_Signup extends StatelessWidget {
  //final color,text;
  final Widget child;
  const TextFieldContainer_Signup({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      height: size.height * 0.08,
      decoration: BoxDecoration(color: Color(0xFFDBC4FF),
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}