import 'package:flutter/material.dart';
import 'package:parentseye_user/utilities/Constants.dart';

class WalkthroughPage2 extends StatefulWidget {
  @override
  _WalkthroughPage2 createState() => new _WalkthroughPage2();
}

class _WalkthroughPage2 extends State<WalkthroughPage2> {
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
            Text("Change pickup and ",style: TextStyle(fontSize: 25),),
            Text("drop points",style: TextStyle(fontSize: 25),),
            ],),
          Container(
            // margin: EdgeInsets.only(right: 10.0),
            child: 
            Row(            
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
            
            children: <Widget>[
            
            Text("<<<",
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
            Text(">>>",
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),              
          ],),
          )
          
      ],
    );
  }
}
