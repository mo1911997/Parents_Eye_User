import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget
{
  @override
  _Dashboard createState() => new _Dashboard();    
}
class _Dashboard extends State<Dashboard>
{  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        backgroundColor: Colors.amberAccent,
        body: SingleChildScrollView( 
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 5.0),
              height:MediaQuery.of(context).size.height/2,              
              width: MediaQuery.of(context).size.width,
              child: Card( 

              )
            ),            
            Container(
              height:MediaQuery.of(context).size.height/2,              
              width: MediaQuery.of(context).size.width,
              child: Card( 

              )
            ),
            Container(
              height:MediaQuery.of(context).size.height/2,              
              width: MediaQuery.of(context).size.width,
              child: Card( 

              )
            )
        ],),
        )
    );
  }
}