import 'package:flutter/material.dart';
import 'package:task_1_zairza/screens/widget.dart';
class Page7 extends StatefulWidget{
  const Page7({Key? key}) : super(key: key);

  @override
  _Page7State createState() => _Page7State();
}
class _Page7State extends State<Page7>{
  int _itemCount = 1;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (BuildContext contex,AsyncSnapshot snapshot){ 
        return Scaffold(
          backgroundColor: Color(0xffE5E5E5),
          appBar: skill1appbar(context),
          bottomNavigationBar: DemoBottomAppBar(),
          body: Row(
            children: List.generate(1, (index) {
              return Padding(
                padding: EdgeInsets.only(left:20,bottom: 20,right: 20,top: 20),
                child: Row(
                  children: [
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
                            width: 13,
                          ),
                        ),
                        child: Column(
                          children:<Widget>[
                            Image(image: AssetImage('assets/images/imagefull.png'),width: 325,),
                            Column(
                              children: [
                                Padding(padding:EdgeInsets.only(left:10,bottom: 10),
                                    child: Row(
                                      children: [
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text('Laptop',style: TextStyle(fontSize: 30,color:Colors.black,fontWeight: FontWeight.bold),)),],)),
                                Text('Zairza',
                                  style: TextStyle(fontSize: 15,color:Colors.black,),

                                ),
                                SizedBox(height: 20,),

                                Text("                                                     \$3000",style: TextStyle(fontSize: 20,color:Color(0xff6A6A6A),fontWeight: FontWeight.bold),),
                                SizedBox(height: 45,width: 30,),
                                Row(
                                  children: [
                                    _itemCount!=0? new  IconButton(icon: new Icon(Icons.remove),onPressed: ()=>setState(()=>_itemCount--),):new Container(),
                                    new Text(_itemCount.toString()),
                                    new IconButton(icon: new Icon(Icons.add),onPressed: ()=>setState(()=>_itemCount++)),
                                  ],
                                ),

                                SizedBox(height: 40,width: 30,),
                                Container(
                                  alignment: Alignment.center,
                                  width: 300,
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                          const Color(0xffFFCA10),
                                          const Color(0xffFFCA10)
                                        ]
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text("Add To Cart",style: TextStyle(
                                      fontSize: 23,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  )
                                  ),
                                ),
                                SizedBox(height: 10,width: 30,),
                                Container(
                                  alignment: Alignment.center,
                                  width: 300,
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
                                  child: Text("Buy Now",style: TextStyle(
                                      fontSize: 23,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  )
                                  ),
                                ),

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
      );
        },
    );

  }
}