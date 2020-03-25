import 'package:flutter/material.dart';
import 'package:parentseye_user/screens/WalkthroughPage1.dart';
import 'package:parentseye_user/screens/WalkthroughPage2.dart';
import 'package:parentseye_user/screens/WalkthroughPage3.dart';
class WalkthroughMain extends StatefulWidget
{
  @override
  _WalkthroughMain createState() => new _WalkthroughMain();
  
  
}
class _WalkthroughMain extends State<WalkthroughMain> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.amberAccent,
      body: PageView(
        children: <Widget>[
          WalkthroughPage1(),
          WalkthroughPage2(),
          WalkthroughPage3(),
        ],
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}