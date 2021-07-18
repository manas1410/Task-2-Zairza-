import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_1_zairza/screens/widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:animated_button/animated_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '7.dart';
import 'Signup.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}



class _SigninState extends State<Signin> {

  final GlobalKey<FormState> _formKey =GlobalKey<FormState>();
  final TextEditingController _emailController =TextEditingController();
  final TextEditingController _passwordController =TextEditingController();
  late bool _gsuccess=false;

  bool _isloggedin = false;
  GoogleSignInAccount? _userobj;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  late String email;
  String wr=" ";


  void _login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,


      );
      setState(() {
        email=_emailController.text;
        _isloggedin=true;
      });

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        setState(() {
          wr='No user found for that email.';
        });
      } else if (e.code == 'wrong-password') {
        setState(() {
          wr='Wrong password provided for that user.';
        });

      }
    }
  }

  void _gresister() async{
    final googleAuth = await _userobj!.authentication;
    final credential1 = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken
    );
    try {
      await FirebaseAuth.instance.signInWithCredential(credential1);
    } on FirebaseAuthException  catch (e) {
      print(e);
    }

  }
  String _email='';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _isloggedin? Scaffold(
        body: SingleChildScrollView(
            child: Container(
              child: Container(
                alignment: Alignment.center,
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(height: 330,),
                      Text(
                        email,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8,),
                      Text("Successfully Signed In",style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),),
                      SizedBox(height: 8,),
                      AnimatedButton(

                        duration: 10,
                        height: 45,
                        width: 150,
                        color: Color(0xff0D49E2),
                        child: Text(
                          'Sign Out',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onPressed: ()  {

                          _googleSignIn.signOut().then((userData){
                            setState(() {
                              _isloggedin=false;
                              wr=" ";
                            });
                          }).catchError((e){
                            print(e);
                          });


                        },
                      ),
                      SizedBox(height: 260,),
                      Text(
                        "Powered by",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Image(
                        image: AssetImage('assets/images/Zairzalogo.webp'),
                        width: 300,
                      ),
                    ],
                  ),
                ),
              ),
            )
        ),
      ):Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - 10,
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min ,
                children: [
                  //SizedBox(height:50,),
                  Text('SkillKart',style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),),
                  SizedBox(height: 40,),
                  Text('Login',style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),),
                  SizedBox(height: 20,),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Email',style: mdTextFieldStyle(),)
                  ),
                  SizedBox(height: 15,),
                  TextField(
                    controller: _emailController,
                    style: simpleTextFieldStyle(),
                    decoration: textFieldInputDecoration(""),
                  ),
                  SizedBox(height: 15,),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Password',style: mdTextFieldStyle(),)
                  ),
                  SizedBox(height: 15,),
                  TextField(
                    controller: _passwordController,
                    style: simpleTextFieldStyle(),
                    decoration: textFieldInputDecoration(""),
                  ),
                  SizedBox(height: 5,),
                  Text(wr,style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),),
                  SizedBox(height: 5,),
                  AnimatedButton(
                    onPressed: () {
                      _login();
                    },
                    duration: 10,
                    height: 70,
                    width: 300,
                    color: Color(0xff0D49E2),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 8,),
                  AnimatedButton(
                    duration: 10,
                    height: 70,
                    width: 300,
                    color: Color(0xff0D49E2),
                    child: Text(
                      'Sign In With Google',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: ()  {
                      _googleSignIn.signIn().then((userData){
                        setState(() {
                          _gresister();
                          _isloggedin=true;
                          _userobj =userData;
                          email=_userobj!.email;
                          _gsuccess=true;

                        });
                      }).catchError((e){
                        print(e);
                      });
                    },
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Dont't have an account? ",style: mediumTextFieldStyle(),),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Signup()),
                          );},
                        child: Text("Create One ",style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue
                        ),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 110,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
