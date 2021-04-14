

import 'package:cookbook_recipe/auth/Auth_Welcome.dart';
import 'package:cookbook_recipe/constants.dart';
import 'package:cookbook_recipe/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ProfileMenuBar extends StatelessWidget {
  const ProfileMenuBar({
    Key key,
    this.iconSrc,this.menuItem, this.press
  }) : super(key: key);

  final String iconSrc,menuItem;
  final Function press;


  @override
  Widget build(BuildContext context) {
    double defualtSize = SizeConfig.defaultSize;
    return InkWell(onTap: press,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: defualtSize*2,vertical: defualtSize*2.5),
        child: SafeArea(
          child: Row(
            children: <Widget>[
              SvgPicture.asset(iconSrc),
              SizedBox(width: defualtSize*2,),
              Text(menuItem,
                style: TextStyle(
                  fontSize: defualtSize* 1.6,
                  color: kPrimaryColor1,
                ),),

              Spacer(),


            ],
          ),
        ),
      ),
    );
  }
}