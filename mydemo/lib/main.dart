import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(myapp());
}

class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "sample app",
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text(
                "First Application",
                style: TextStyle(
                  fontFamily: "Times New Roman",
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
            //****************************************** */

            body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add_a_photo),
                      iconSize: 50.0,
                      splashColor: Colors.green,
                      tooltip: "lick my dick",
                    ),

                    RaisedButton(
                      onPressed: () {},


                      splashColor: Colors.green,

                    ),

                    MaterialButton(
                      onPressed: (){},
                      splashColor: Colors.redAccent[400],
                      color: Colors.green[400],
                      elevation: 12.0,
                      child: Text(
                        "Material Button",
                        style: TextStyle(fontSize: 25.0,
                        ),

                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      ),


                     MaterialButton(
                        onPressed: () {},
                        splashColor: Colors.red[300],
                         color: Colors.blue[400],
                         elevation: 10.0,
                         child: Text(
                        "Material Button",
                        style: TextStyle(fontSize: 20.0),
                        ),

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                    ),

                    //*************************** raised button*********************
                    RaisedButton(
                      onPressed: () {},
                      splashColor: Colors.cyan[300],
                      shape: Border.all(
                        width: 2.0,
                        color: Colors.green,
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                      child: Text(
                        "Raised button",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.red,
                        ),
                      ),
                    ),

                    //************************ flat button***************
                    FlatButton(
                      color: Colors.lightGreen,
                      splashColor: Colors.red,
                      textColor: Colors.black,
                      padding: EdgeInsets.all(9.0),
                      onPressed: () {},
                      child: Text(
                        "new button",
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                    ),

                    //**************************** */ widget fot text formatting******************************************************
                    Text(
                      "hii i am uday singh bana",
                      textAlign: TextAlign.left,
                      textDirection: TextDirection.ltr,
                      style: new TextStyle(
                        background: Paint()
                          ..color = Colors.black
                          ..style = PaintingStyle.stroke,
                        decoration: TextDecoration.lineThrough,
                        decorationStyle: TextDecorationStyle.dashed,
                        decorationColor: Colors.black,
                        fontFamily: "Times New Roman",
                        color: Colors.red,
                        fontSize: 24.0,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]
                  ),
                  
            )
            )
            );
  }
}
