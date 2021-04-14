import 'package:cookbook_recipe/constants.dart';
import 'package:cookbook_recipe/models/MyBottamNavBar.dart';
import 'package:cookbook_recipe/models/profile/Profile_Body.dart';
import 'package:cookbook_recipe/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: Profile_Body(),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor1,
      centerTitle: true,
      title: Text("Profile"),
      actions: <Widget>[
       IconButton(onPressed: (){},
           icon: SvgPicture.asset("assets/icons/info.svg"),



           )
      ],
    );

  }
}
