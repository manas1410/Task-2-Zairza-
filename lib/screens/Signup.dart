import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_1_zairza/screens/widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:animated_button/animated_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'Signin.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {


  //final GlobalKey<FormState> _formKey =GlobalKey<FormState>();
  final TextEditingController _emailController =TextEditingController();
  final TextEditingController _passwordController =TextEditingController();
  final TextEditingController _conpasswordController =TextEditingController();
  late bool _success=false;
  //late String _useremail;
  bool _isloggedin = false;
  GoogleSignInAccount? _userobj;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  String wr=" ";

  late String email;

  void _register() async {
    try {
      if(_passwordController.text==_conpasswordController.text) {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
            email: _emailController.text,
            password: _passwordController.text
        );
        setState(() {
          wr="Succesfully Signup Up";
          _success=true;
        });

      }
      else{
        setState(() {
          wr="Password Does Not Match";
          _success=false;
        });

      }

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        setState(() {
          wr='The password provided is too weak.';
          _success=false;
        });

      } else if (e.code == 'email-already-in-use') {
        setState(() {
          wr='The account already exists for that email.';
          _success=false;
        });

      }
    } catch (e) {
      print(e);
      wr="Invalid Inputs";
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
          //height: MediaQuery.of(context).size.height ,
          //alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24,vertical: 50),
            child: Column(
              mainAxisSize: MainAxisSize.min ,
              children: [
                Text('SkillKart',style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),),
                SizedBox(height: 40,),
                Text('Register',style: TextStyle(
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
                SizedBox(height: 15,),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Confirm Password',style: mdTextFieldStyle(),)
                ),
                SizedBox(height: 15,),
                TextField(
                  controller: _conpasswordController,
                  style: simpleTextFieldStyle(),
                  decoration: textFieldInputDecoration(""),
                ),
                SizedBox(height: 7.5,),
                Align(
                    alignment: Alignment.center,
                    child:_success?Text(wr,style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),)
                :
                Text(wr,style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),)),
                SizedBox(height: 7.5,),
                AnimatedButton(
                  onPressed: () {
                    _register();
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
                SizedBox(height: 13,),
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

                        _isloggedin=true;
                        _userobj =userData!;
                        email=_userobj!.email;
                        print(_userobj);
                        _gresister();
                      });
                    }).catchError((e){
                      print(e);
                    });
                  },
                ),
                SizedBox(height: 13,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Have an account? ",style: mediumTextFieldStyle(),),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Signin()),
                        );},
                        child:
                        Text("Login Now ", style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue
                        ),
                        )
                    ),

                  ],
                ),
                SizedBox(height: 110,),

              ],
            ),
          ),
        ),
      ),
    ));
  }
}


