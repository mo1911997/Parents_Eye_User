import 'package:flutter/material.dart';
import 'package:parentseye_user/animations/FadeRoute.dart';
import 'package:parentseye_user/screens/GetMobileNo.dart';
import 'package:parentseye_user/utilities/Constants.dart';

class WalkthroughPage3 extends StatefulWidget
{
  @override
  _WalkthroughPage3 createState() => new _WalkthroughPage3();    
}
class _WalkthroughPage3 extends State<WalkthroughPage3>
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
            Text("Ensure the safety ",style: TextStyle(fontSize: 25.0),),
            Text("of your children !",style: TextStyle(fontSize: 25.0),),
            ],),
          Container(
            // margin: EdgeInsets.only(right: 10.0),
            child: 
            Row(            
            mainAxisAlignment:  MainAxisAlignment.center,
            
            children: <Widget>[
            
            RaisedButton(          
              onPressed: () {
                  Navigator.push(
                  context,
                  FadeRoute(page: GetMobileNo()));
              },
              color: Colors.lightBlueAccent,
              textColor: Colors.white,
              elevation: 0,    
              child: Text("Done",
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
            )
          ],),
          )          
      ],
    );
  }  
}