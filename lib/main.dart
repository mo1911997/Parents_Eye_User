import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
void main(){
  runApp(new MaterialApp(
    home: new MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      
      seconds: 4,
      navigateAfterSeconds: new AfterSplash(),
      title: new Text('ParentsEye',
        style: new TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 30.0
        ),
      ),
      image: Image(image: AssetImage('assets/splash_logo.png')),
      // backgroundGradient: new LinearGradient(colors: [Colors.cyan, Colors.blue], begin: Alignment.topLeft, end: Alignment.bottomRight),
      backgroundColor: Color(0xffff8533),
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 130.0,
      onClick: ()=>print("Flutter Egypt"),
      loaderColor: Colors.black,
    );
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      
      body: PageView(
        children: <Widget>[
          Container(
            child: Center(child:Text("Page 1")),
            color: Colors.red,
          ),
          Container(
            child: Center(child:Text("Page 2")),
            color: Colors.blueAccent,
          )
        ],
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}