import 'package:cookbook_recipe/Another_auth/Auth12.dart';
import 'package:cookbook_recipe/auth/Auth_Body.dart';
import 'package:cookbook_recipe/auth/Screen_Function/screenfunction.dart';
import 'package:cookbook_recipe/auth/login/background.dart';
import 'package:cookbook_recipe/auth/signup/Signup_Screen.dart';
import 'package:cookbook_recipe/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Login_Body extends StatelessWidget {
  final child;
  const Login_Body({
    Key key,
    @required this.child,

  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Form(
        //key: globalFormKey,
        child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height*0.03,),
            /*
            GestureDetector(onTap: (){
              Navigator.pop(context);
            },
              child: Positioned(
                top: 0,left: 0,
                child: SvgPicture.asset("assets/icons/back.svg"),

              ),
            ),

             */

            Text("Login To प्रसादम् ! ",
              style: TextStyle(fontSize: 30,
                  fontFamily: "cursive",
                  fontWeight: FontWeight.bold
              ),
            ),
            SvgPicture.asset("assets/icons/login.svg",height: size.height * 0.32,),

            TextFieldContainer(child: TextFormField(

              maxLines: 1,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value){},
              decoration: InputDecoration(
                  icon: Icon(Icons.person,color: Color(0xFFA336F8),),
                  hintText: "Your Email",
              border: InputBorder.none,
              ),
            ),
            ),

            // Text field for password
            TextFieldContainer(child: TextFormField(
              validator: (value){
                if(value == null || value.isEmpty)
                {
                  return "Please ";
                }
                return null;
                },


              maxLines: 1,
              keyboardType: TextInputType.text,
              onChanged: (value){},
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.lock,color: Color(0xFFA336F8),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                suffixIcon: Icon(Icons.visibility, color: Color(0xFFA336F8),
                ),

                hintText: "Password",
                border: InputBorder.none,
              ),
            ),
            ),

            RoundedButton(text: "Login",
            color: kPrimaryColor2,
            press: (){},),
            SizedBox(height: size.height*0.02,),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Create An Account !",
                  style: TextStyle(color: Color(0xFFA336F8),),
                ),
                InkWell(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context){
                        return Signup_Screen();
                      }));
                },
                    child: Text("Sign Up", style: TextStyle(fontWeight: FontWeight.bold, color: Color(
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
                  builder: (context) {return Another_auth12();}
                  ));
                  },
                ),
              ],
            ),
            SizedBox(height: size.height*0.03,),
          ],
        ),
    ),
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  //final color,text;
  final Widget child;
  const TextFieldContainer({
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

