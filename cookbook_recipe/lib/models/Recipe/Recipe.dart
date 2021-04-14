import 'package:flutter/material.dart';

class Recipe_Detail extends StatelessWidget {


  const Recipe_Detail( {Key key, }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(

          child: Stack(
            children: [
              Container(
                height: size.height*0.32,
                child: Image.asset("assets/images/image_1.png", fit: BoxFit.cover,),
              ),



              DraggableScrollableSheet(
                maxChildSize: 1,
                initialChildSize: 0.6,
                minChildSize: 0.6,
                builder: (context, controller){
                  return SingleChildScrollView(
                    child: Container(
                      color: Colors.white,
                      height: 800,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50))
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ));
  }
}
