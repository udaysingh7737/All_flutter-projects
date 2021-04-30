import 'package:cookbook_recipe/constants.dart';
import 'package:cookbook_recipe/models/MyBottamNavBar.dart';
import 'package:cookbook_recipe/models/profile/Profile_Body.dart';
import 'package:cookbook_recipe/size_config.dart';
import 'package:cookbook_recipe/utils/Util_Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor1,
        centerTitle: true,
        title: Text("Profile"),
        actions: <Widget>[
          IconButton(onPressed: (){

            Util_Constents.preferences.setBool("loggedin", false);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Log Out..."),));
            Navigator.pushNamedAndRemoveUntil(context, "/login",(Route<dynamic> route) => false,);
          },

            icon: SvgPicture.asset("assets/icons/logout.svg"),



          )
        ],
      ),
      body: Profile_Body(),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }


}
