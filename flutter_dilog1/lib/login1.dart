import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dilog1/pages/home.dart';
import 'package:flutter_dilog1/singin1.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Loginpage extends StatefulWidget {

  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> with SingleTickerProviderStateMixin{
  final GlobalKey<FormState> formkey_1 = GlobalKey<FormState>();

  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;
  String _email;
  String _password;
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final GoogleSignIn googleSignIn= new GoogleSignIn();
/*
  Future<FirebaseUser> _singIn() async{
    GoogleSignInAccount googleSignInAccount=await googleSignIn.signIn();
    GoogleSignInAuthentication gSA=await googleSignInAccount.authentication;

    FirebaseUser user =await _auth.signInWithGoogle(
    idToken : gSA.idToken, accessToken:gSA.accessToken);

    print("User name: ${user.displayName}");
    return user;

  }

 */

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
      appBar: AppBar(title: Text("Login"),),

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
                new FlutterLogo(
                  size: _iconAnimation.value*100,
                ),

                new Form(key: formkey_1,
                    child: Theme(
                  data: new ThemeData(brightness: Brightness.dark,
                  primarySwatch: Colors.teal,
                  inputDecorationTheme: new InputDecorationTheme(labelStyle: new TextStyle(color: Colors.teal,fontSize: 20.0))),
                  child: Container(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            validator:(input){
                              if(input.isEmpty){
                                return "can't be Empty";
                              }else{
                                return null;
                              }
                            },
                            autocorrect: true,
                            maxLines: 1,
                            maxLength: 30,
                            decoration:
                          InputDecoration(hintText: "Enter your Email",
                            border: OutlineInputBorder(),
                            labelText: "Email Address",
                            prefixIcon: Icon(Icons.mail_outline)
                          ),

                            onSaved: (input)=> _email= input,
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                          new TextFormField(
                            validator: (value){
                              if(value.isEmpty){

                                return "this field is required";
                              }if(value.length < 8){
                                return "lenth must between 8-16";
                              }
                              return null;
                            },
                            autocorrect: true,
                            maxLength: 16,
                            maxLines: 1,
                            decoration: new InputDecoration(
                              prefixIcon: Icon(Icons.vpn_key),
                              border: OutlineInputBorder(),
                              labelText: "Password",
                              hintText: "Enter Your Password",
                            ),
                            onSaved: (value)=> _password=value,
                            keyboardType: TextInputType.text,
                            obscureText: true,
                          ),
                        ),

                        new Padding(padding: const EdgeInsets.only(top:10.0),
                        ),
                        new MaterialButton(
                          height: 40.0,
                          minWidth: 80.0,
                          color: Colors.lightGreen,
                          splashColor: Colors.redAccent,
                          textColor: Colors.white,
                          child: Text("Log In"),
                          onPressed: logIn,
                        ),

                        /*
                        MaterialButton(onPressed: (){},
                          padding: EdgeInsets.zero,

                          child:
                          Image(
                            image: AssetImage('assets/images/logo.png'),
                            width: 200.0,
                          ),
                          splashColor: Colors.purpleAccent,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        */ //google image

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
                    ),
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
      try {
        UserCredential user= await FirebaseAuth.instance.createUserWithEmailAndPassword(email:_email, password:_password);
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Home1k()));
      }catch(e) {
        print(e.message);
      }

      }
  }


}
