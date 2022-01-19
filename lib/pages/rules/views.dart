import 'package:flutter/material.dart';

class Rules extends StatefulWidget {
  const Rules({ Key? key }) : super(key: key);

  @override
  _RulesState createState() => _RulesState();
}

class _RulesState extends State<Rules> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text('Rules and Regulations'),
      backgroundColor: Color(0xff06611F),),
      body:Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child:Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0)
            ))
          ],
        ),
      )
    );
  }
}