import 'package:cookbook_recipe/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'MyBottamNavBar.dart';
import 'body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: EdgeInsets.only(top:SizeConfig.defaultSize *1.0),
        child: Body(),

      ),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(
          icon: SvgPicture.asset('assets/icons/menu.svg'),
          splashColor: Colors.white38,
          onPressed: () {}
      ),
      centerTitle: true,
      title: Image.asset('assets/images/prasadam_logo1.jpg'

      ),

      actions: <Widget>[IconButton(
          icon: SvgPicture.asset('assets/icons/search1.svg'),
          tooltip: "Search",
          splashColor: Colors.white38,
          onPressed: () {}
          ),
        SizedBox(width: SizeConfig.defaultSize * 0.5)
      ],
    );
  }
}
