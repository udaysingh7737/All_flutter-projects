import 'package:cookbook_recipe/UserProfile/AppBar_UserProfile.dart';
import 'package:cookbook_recipe/UserProfile/UserInfo.dart';
import 'package:cookbook_recipe/UserProfile/userProfile_Widget.dart';
import 'package:cookbook_recipe/UserProfile/user_preferences.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  UserInfo user =UserPreferences.myUser;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            ProfileWidget(
              profileImage: user.profileImage,
              isEdit: false,
              onClicked: () async{
                return Navigator.pushNamed(context, "/editProfile");
              },
            )
          ],
        )
    );
  }
}
