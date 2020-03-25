import 'package:flutter/material.dart';
import 'package:parentseye_user/screens/WalkthroughPage2.dart';
import 'package:parentseye_user/utilities/Constants.dart';

class WalkthroughPage1 extends StatefulWidget
{
  @override
  _WalkthroughPage1 createState() => new _WalkthroughPage1();
  
  
}
class _WalkthroughPage1 extends State<WalkthroughPage1>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(      
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.asset(Constants.SPLASH_LOGO,
        height: 200.0,
        width: 300.0,
         fit: BoxFit.fill,
        ),
          Wrap( 
            direction: Axis.vertical, 
            children: <Widget>[
            Text("Track your children\'s ",style: TextStyle(fontSize: 25),),
            Text("activities in realtime",style: TextStyle(fontSize: 25),),
            ],),
          Container(
            // margin: EdgeInsets.only(right: 20.0),
            child: 
            Row(            
            mainAxisAlignment:  MainAxisAlignment.center,            
            children: <Widget>[                                  
              Text(">>>",
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),                           
          ],),
          )
          
      ],
    );
  }
  
}