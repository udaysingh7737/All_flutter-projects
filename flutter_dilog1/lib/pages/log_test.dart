import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dilog1/pages/home.dart';
import 'package:flutter_dilog1/pages/locmap.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Loginpage1 extends StatefulWidget {

  @override
  _Loginpage1State createState() => _Loginpage1State();
}

class _Loginpage1State extends State<Loginpage1> with SingleTickerProviderStateMixin{
  final GlobalKey<FormState> formkey_1 = GlobalKey<FormState>();

  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;
  String _email;
  String _password;
  FirebaseAuth _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();

  Future<UserCredential> _handleSignIn() async {
    final googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential user1 = await _auth.signInWithCredential(credential);
    print("signed in " );
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home1k()));
    return user1;
  }




  @override
  void initState(){
    super.initState();
    _iconAnimationController=new AnimationController(
        vsync: this,
        duration: new Duration(microseconds: 500)
    );
    _iconAnimation= new CurvedAnimation(
        parent: _iconAnimationController,
        curve: Curves.bounceInOut
    );
    _iconAnimation.addListener(()=> this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("Login test1"),),

      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(image: new AssetImage("assets/images/logo.png"),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          SingleChildScrollView(

            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: new FlutterLogo(
                    size: _iconAnimation.value*100,
                  ),
                ),

                new  Form(
                    key: formkey_1,
                child: Theme(
                data: new ThemeData(brightness: Brightness.dark,
                primarySwatch: Colors.teal,
                inputDecorationTheme: new InputDecorationTheme(labelStyle: new TextStyle(color: Colors.teal,fontSize: 20.0))),
                child: Container(
                   padding: const EdgeInsets.all(25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          validator: (input) {
                            if(input.isEmpty){
                              return 'Provide an email';
                            }else{
                              return null;
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: true,
                          maxLines: 1,
                          maxLength: 30,
                          decoration:
                          InputDecoration(hintText: "Enter your Email",
                              border: OutlineInputBorder(),
                              labelText: "Email Address",
                              prefixIcon: Icon(Icons.mail_outline)
                          ),
                          onSaved: (input) => _email = input,
                        ),
                        TextFormField(
                          validator: (input) {
                            if(input.length < 8){
                              return 'Longer password please';
                            }else {return null;}
                          },

                          onSaved: (input) => _password = input,
                          obscureText: true,

                          autocorrect: true,
                          maxLength: 16,
                          maxLines: 1,
                          decoration: new InputDecoration(
                            prefixIcon: Icon(Icons.vpn_key),
                            border: OutlineInputBorder(),
                            labelText: "Password",
                            hintText: "Enter Your Password",
                          ),

                          keyboardType: TextInputType.text,

                        ),



                        RaisedButton(
                          onPressed: (){},
                          child: Text('Log in' ),

                        ),
                        SizedBox(
                          height: 30.0,
                        ),


                        Padding(
                          padding:  EdgeInsets.zero,
                          child: MaterialButton(onPressed: ()=>_handleSignIn()
                              .then((UserCredential user) => print(user))
                              .catchError((e) => print(e)),


                            child: Image(
                              image: AssetImage('assets/images/google11.png'),
                              width: 200.0,
                              height: 50,
                            ),
                            splashColor: Colors.white12,
                          ),
                        ),

                        SizedBox(
                          height: 10.0,
                        ),

                        Container(
                          padding: EdgeInsets.only(top:15.0),
                          child: InkWell(

                            onTap:  ()=>Navigator.of(context).pushNamed("/sing"),
                            child: Text(
                              "Create an Account",style: TextStyle(color: Colors.lightBlueAccent,decoration: TextDecoration.underline,fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    )
                ),
                )
                )
              ],
            ),
          )
        ],
      ),

    );
  }

  void logIn() async {
    if(formkey_1.currentState.validate()){
      formkey_1.currentState.save();
      try{
        UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context, MaterialPageRoute(builder: (context) => MyMap()));
      }catch(e){
        print(e.message);
      }
    }
  }

  void logout() async{
    await  _googleSignIn.disconnect();
    await  _googleSignIn.signOut();

    Navigator.of(context).pushNamed("/log");
  }


}
