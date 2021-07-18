import 'dart:async';

import 'package:flutter/material.dart';

import 'Signin.dart';

class Welcome extends StatefulWidget{
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}
class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {

    Timer(
      Duration(seconds: 3),
          () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Signin()));
      },
    );
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
            child: Container(
              alignment: Alignment.center,
              child: Container(
                child: Column(
                  children: [
                    SizedBox(height: 300,),
                    Text(
                      "SkillKart",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
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
    );

  }
}
