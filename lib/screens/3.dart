import 'package:flutter/material.dart';
import 'package:task_1_zairza/screens/widget.dart';
class Page3 extends StatefulWidget{
  const Page3({Key? key}) : super(key: key);

  @override
  _Page3State createState() => _Page3State();
}
class _Page3State extends State<Page3>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffE5E5E5),
        appBar: orderappbar(context),
        bottomNavigationBar: DemoBottomAppBar(),
        body: Container(
          child: Wrap(
              children:[
                SizedBox(height: 30,width: 10,),
                SingleChildScrollView(
                  child: Container(
                    child: Wrap(
                      children: List.generate(20, (index) {
                        return Padding(
                          padding: EdgeInsets.only(left:20,bottom: 20,right: 20),
                          child: Column(
                            children: [
                              Text("21st july",style: TextStyle(color: Colors.black)),
                              SizedBox(height: 5,),
                              Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow:  [
                                      BoxShadow(
                                        color: Colors.white.withOpacity(1),
                                        spreadRadius: 5,
                                        blurRadius: 0,
                                        offset: Offset(0, 1), // changes position of shadow
                                      ),
                                    ],
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 10,
                                    ),
                                  ),
                                  child: Row(
                                    children:<Widget>[
                                      Image(image: AssetImage('assets/images/imagefull.png'),),
                                      Column(
                                        children: [
                                          Padding(padding:EdgeInsets.only(left:10,bottom: 10),
                                              child: Column(
                                                children: [
                                                  Text('Laptop',style: TextStyle(fontSize: 28,color:Colors.black),),],)),
                                          Text('Zairza',
                                            style: TextStyle(fontSize: 10,color:Colors.black),
                                            textAlign: TextAlign.left,
                                          ),
                                          SizedBox(height: 30,),
                                          Text("\$3000",style: TextStyle(fontSize: 20,color:Colors.black),)
                                        ],
                                      )


                                    ],
                                  )

                              )




                            ],
                          ),
                        );

                      }
                      ),
                    ),
                  ),
                ),



              ]
          ),
        )
    );

  }
}