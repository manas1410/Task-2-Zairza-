import 'package:flutter/material.dart';
PreferredSizeWidget skillappbar(BuildContext context){
  return AppBar(
    backgroundColor: Colors.white,
    toolbarHeight: 70,
    title: Align(
      alignment:  Alignment.center,
      child: Text(
        "      SkillKart",
        style: TextStyle(
          fontSize: 30,
          color: Colors.black,
        ),
      ),
    ),
      actions: <Widget>[
        Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: GestureDetector(
                onTap: () {},
                child: IconButton(
                  icon: const Icon(Icons.shopping_cart_rounded,color: Colors.black,),
                  onPressed: () {},
                ),
              )
        ),
      ]
  );
}
class DemoBottomAppBar extends StatefulWidget {
  const DemoBottomAppBar({Key? key}) : super(key: key);

  @override
  State<DemoBottomAppBar> createState() => _DemoBottomAppBarState();
}


class _DemoBottomAppBarState extends State<DemoBottomAppBar>{
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xff0D49E2),
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.black,
      onTap: _onItemTapped,
      items: [
        new BottomNavigationBarItem(
          backgroundColor: Colors.red,
          icon: new Icon(Icons.home,color: _selectedIndex==0 ? Colors.black : Colors.white),
          label: ''
        ),
        new BottomNavigationBarItem(
          icon: new Icon(Icons.restore_outlined,color: _selectedIndex==1 ? Colors.black : Colors.white,),
          label: ''
        ),

        new BottomNavigationBarItem(
            icon: Icon(Icons.person,color: _selectedIndex==2 ? Colors.black : Colors.white),
            label: ''
        )
      ],

    );
  }
}

PreferredSizeWidget orderappbar(BuildContext context){
  return AppBar(
      backgroundColor: Colors.white,
      toolbarHeight: 70,
      leading: GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      title: Align(
        alignment:  Alignment.center,

        child: Text(
          "Your Orders",
          style: TextStyle(
            fontSize: 30,
            color: Colors.black,
          ),
        ),
      ),

  );
}

PreferredSizeWidget profileappbar(BuildContext context){
  return AppBar(
    backgroundColor: Colors.white,
    toolbarHeight: 70,
    leading: GestureDetector(
      onTap: () {},
      child: Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ),
    ),
    title: Align(
      alignment:  Alignment.center,

      child: Text(
        "Your Orders",
        style: TextStyle(
          fontSize: 30,
          color: Colors.black,
        ),
      ),
    ),

  );
}

InputDecoration textFieldInputDecoration(String xtext){
  return InputDecoration(
    hintText: xtext,
    border: OutlineInputBorder(),
  );
}

TextStyle simpleTextFieldStyle(){
  return TextStyle(
    fontSize: 16,
  );
}

TextStyle mediumTextFieldStyle(){
  return TextStyle(
    fontSize: 17,
  );
}
TextStyle mdTextFieldStyle(){
  return TextStyle(
      fontSize: 23,
      color: Colors.black,
      fontWeight: FontWeight.bold
  );
}

PreferredSizeWidget skill1appbar(BuildContext context){
  return AppBar(
      backgroundColor: Colors.white,
      toolbarHeight: 70,
      leading: GestureDetector(
        onTap: () {},
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
      title: Align(
        alignment:  Alignment.center,
        child: Text(
          "SkillKart",
          style: TextStyle(
            fontSize: 30,
            color: Colors.black,
          ),
        ),
      ),
      actions: <Widget>[
        Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: () {},
              child: IconButton(
                icon: const Icon(Icons.shopping_cart_rounded,color: Colors.black,),
                onPressed: () {},
              ),
            )
        ),
      ]
  );
}
PreferredSizeWidget profile1appbar(BuildContext context){
  return AppBar(
    backgroundColor: Colors.white,
    toolbarHeight: 70,
    leading: GestureDetector(
      onTap: () {},
      child: Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ),
    ),
    title: Align(
      alignment:  Alignment.centerLeft,

      child: Text(
        "           Profile",
        style: TextStyle(
          fontSize: 30,
          color: Colors.black,
        ),
      ),
    ),

  );
}

