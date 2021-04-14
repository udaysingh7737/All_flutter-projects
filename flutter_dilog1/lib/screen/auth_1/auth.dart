import 'package:flutter/material.dart';
import 'package:flutter_dilog1/main.dart';
import 'package:flutter_dilog1/pages/locmap.dart';
import 'package:flutter_dilog1/screen/auth_1/background_painter.dart';


class AuthScreen extends StatefulWidget {
  const AuthScreen({Key key}):super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  @override

  void initState(){
    _controller= AnimationController(vsync: this,duration: Duration(seconds: 2));
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: CustomPaint(
              painter:BackgroundPainter(
                animation: _controller.view,
              ) ,
            )
          ),
          Center(
            child: Row(
              children: [
                Center(
                  child: RaisedButton(onPressed: (){
                    _controller.forward(from: 0);

                  },
                  child: Text("Animate"),),
                ),


                Center(
                  child: MaterialButton(child: Text("Know Your Location",style: TextStyle(color: Colors.red),),

                    onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> MyMap())),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }


}
