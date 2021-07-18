import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_1_zairza/screens/widget.dart';

class Page4 extends StatefulWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profile1appbar(context),
      bottomNavigationBar: DemoBottomAppBar(),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 300,
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min ,
              children: [
                //SizedBox(height:50,),
                Icon(Icons.person,color: Colors.black,size: 200,),
                Text("Not logged in",
                  style: TextStyle(
                    fontSize: 25,
                      fontWeight: FontWeight.bold,
                          color: Colors.black,
                  ),
                ),
                SizedBox(height: 100,),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          const Color(0xff0D49E2),
                          const Color(0xff0D49E2)
                        ]
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text("Login",style: TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
