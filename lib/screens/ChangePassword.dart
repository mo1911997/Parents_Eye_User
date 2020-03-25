import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parentseye_user/animations/FadeRoute.dart';
import 'package:parentseye_user/screens/ConfirmChildren.dart';
import 'package:parentseye_user/screens/ExitConfirmationDialog.dart';

class ChangePassword extends StatefulWidget
{
  @override
  _ChangePassword createState() => new _ChangePassword();    
}
class _ChangePassword extends State<ChangePassword>
{  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: SingleChildScrollView( 
        child: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                          margin: EdgeInsets.only(top:20.0,bottom: 20.0),
                          child: Icon(Icons.track_changes,size: 100.0,)
                        ),
              new Card(
                child: new Container(                  
                  padding: new EdgeInsets.all(32.0),
                  child: new Column(
                    children: <Widget>[                                              
                        TextField(
                          obscureText: true,                        
                          decoration: InputDecoration(
                            labelText: 'New Password',
                            
                          ),
                        ),
                        TextField(
                          obscureText: true,                        
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            
                          ),
                        ),
                        Container( 
                          margin: EdgeInsets.only(top: 20.0),
                          child: RaisedButton(                    
                          textColor : Colors.white,    
                          onPressed: () {
                          //   Navigator.push(context, 
                          //  FadeRoute(page: ConfirmChildren()));
                          },
                          child: Text("Update Password",
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
                          color: Colors.lightBlueAccent,
                        ),
                      ),                                            
                    ],
                  ),
                ),
              ),              
            ],
          ),
        ),
      ),
      )
    );         
  }
}

