
import 'package:cookbook_recipe/models/profile/Profile_menu_item.dart';
import 'package:cookbook_recipe/models/profile/profile.dart';
import 'package:cookbook_recipe/size_config.dart';
import 'package:flutter/material.dart';


class Profile_Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double defualtSize = SizeConfig.defaultSize;
    return SingleChildScrollView(
      child: Column(
          children: <Widget>[
            Info(
                name: "Uday singh",
                email: "Rupendra@gmail.com",
                image: "assets/images/Avtar.png"
            ),
            SizedBox(height: defualtSize *2,),

            ProfileMenuBar(
              iconSrc: "assets/icons/bookmark_fill.svg",
              menuItem: "Saved Recipes",press: (){},
            ),


            ProfileMenuBar(
              iconSrc: "assets/icons/language.svg",
              menuItem: "Change language",press: (){},
            ),

            ProfileMenuBar(
              iconSrc: "assets/icons/info.svg",
              menuItem: "Help!",press: (){},
            ),
          ]

      ),
    );
  }
}




