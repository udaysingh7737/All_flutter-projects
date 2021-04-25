


import 'package:cookbook_recipe/models/profile/Profile_menu_item.dart';
import 'package:cookbook_recipe/models/profile/profile_info.dart';
import 'package:cookbook_recipe/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Profile_Body extends StatelessWidget {


  @override

  Widget build(BuildContext context) {
    final userName = Provider.of<String>(context);
    double defualtSize = SizeConfig.defaultSize;
    return SingleChildScrollView(
      child: Column(
          children: <Widget>[
            Info(
                name: userName,
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




