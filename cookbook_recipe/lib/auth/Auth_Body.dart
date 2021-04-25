import 'package:cookbook_recipe/Another_auth/Auth12.dart';
import 'package:cookbook_recipe/Another_auth/SIng_Up12.dart';
import 'package:cookbook_recipe/auth/background.dart';
import 'package:cookbook_recipe/constants.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class Auth_Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // to fetch total height and width of our screen
    Size size = MediaQuery.of(context).size;
    return Background(
      child:
      SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text("Welcome to प्रसादम् ! ",
              style: TextStyle(
                  fontSize: 33,fontFamily: "cursive",fontWeight: FontWeight.bold
            ),
            ),
            SizedBox(height: size.height*0.03,),
            SvgPicture.asset("assets/icons/chat.svg",
            height: size.height * 0.45,),

            RoundedButton(
              text: "LOG IN",
              color: kPrimaryColor2,
              press: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Another_auth12();
                }
                )
                );
              },
            ),
            SizedBox(height: size.height * 0.025,),
            RoundedButton(
              text: "SIGN UP",
              color: Color(0xFFDEB0E3),
              textColor: Colors.black87,
              press: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Sing_up12();
                }
                )
                );
              },

            ),
            SvgPicture.asset("assets/images/decoration_line.png"),



          ],
        ),
      ),
    );

  }
}

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color,textColor;
  const RoundedButton({
    Key key,
    this.text,
    this.press ,
    this.color ,
    this.textColor = Colors.white,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.85,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),

        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            color: color,
            onPressed: press,
            child:
            Text(text,style:
            TextStyle(
                fontWeight: FontWeight.w500,color: textColor
            ),
            )
        ),
      ),
    );
  }
}

