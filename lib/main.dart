import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:parentseye_user/animations/FadeRoute.dart';
import 'package:parentseye_user/screens/Home.dart';
import 'package:parentseye_user/screens/WalkthroughMain.dart';
import 'package:parentseye_user/utilities/Constants.dart';

void main(){
  runApp(new MaterialApp(
    home: new MyApp(),
    debugShowCheckedModeBanner: false,    
    theme: ThemeData(fontFamily: 'Montserrat'),
  ));
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
final _storage = FlutterSecureStorage();
  void navigationPage() async
  {
    String verified_user = await _storage.read(key:"verified_user");
    if(verified_user == null)
    {
      Navigator.push(context, FadeRoute(page: WalkthroughMain()));
    }
    else
    {
      Navigator.push(context, FadeRoute(page: Home()));
    }    
  }
  startTimer() async
  {
    var duration = new Duration(seconds: 5);
    return new Timer(duration,navigationPage);
  }
  @override
  void initState()
  {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold( 
      backgroundColor: Colors.amberAccent,
      body: Column(      
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
          Image.asset(Constants.SPLASH_LOGO,
        height: 200.0,
        width: 300.0,
         fit: BoxFit.fill,
        )
        ],)
        ,
        Row( 
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
          Text('ParentsEye',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30.0),)
        ],)
          
          
      ],
    ),
    );
  }
}