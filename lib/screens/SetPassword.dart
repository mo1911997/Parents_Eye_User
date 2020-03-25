import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:parentseye_user/animations/FadeRoute.dart';
import 'package:parentseye_user/screens/ExitConfirmationDialog.dart';
import 'package:parentseye_user/screens/GetOTPAfterGetContact.dart';
import 'package:parentseye_user/screens/Login.dart';
import 'package:http/http.dart' as http;
import 'package:parentseye_user/utilities/Constants.dart';

class SetPassword extends StatefulWidget
{
  String contactno;
  SetPassword(this.contactno);
  @override
  _SetPassword createState() => new _SetPassword();    
}
class _SetPassword extends State<SetPassword>
{  

  var url;
  var newPasswordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    url = Constants.BASE_URL +"parents/update_password";
  }
  void changePassword() async
  {
    if(newPasswordController.text == confirmPasswordController.text)
    {
          http.Response response = await http.post(
            url,
            body: {
              'contact' : widget.contactno,
              'password':newPasswordController.text
            },
            headers: {
              'Accept' : 'application/json'
            }
          );
        print(response.body);
        if(response.statusCode == 200)
        {
          var decodedResponse = json.decode(response.body);
          if(decodedResponse['state'] == 'success')
          {
              Navigator.push(context, 
              FadeRoute(page: Login()));   
          }
          else 
          {
            Fluttertoast.showToast(
                  msg: "Cannot set password !",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIos: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
          }
        }
        else 
        {
          Fluttertoast.showToast(
                  msg: "Something went wrong !",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIos: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
        }
    }
    else 
    {
      Fluttertoast.showToast(
                  msg: "Passwords doesn't match !",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIos: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              ); 
    }
  }
  @override
  Widget build(BuildContext context) {
    
    return WillPopScope( 
      onWillPop: (){
        showDialog(
    context: context,
    builder: (BuildContext context) {
      return ExitConfirmationDialog();
    },
  );
      },
      child: Scaffold(
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
                child: Icon(Icons.memory,size: 100.0,),
              ),
              
              new Card(
                child: new Container(                  
                  padding: new EdgeInsets.all(32.0),
                  child: new Column(
                    children: <Widget>[
                      TextField(
                        controller:  newPasswordController,
                        obscureText: true,
                        keyboardType: TextInputType.text,                                                   
                          decoration: InputDecoration(
                            labelText: 'Password',
                            
                          ),
                        ),
                        TextField(
                        controller:  confirmPasswordController,
                        obscureText: true,
                        keyboardType: TextInputType.text,                        
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            
                          ),
                        ),
                        Container( 
                          margin: EdgeInsets.only(top: 20.0),
                          child: RaisedButton(                    
                          textColor : Colors.white,    
                          onPressed: () {
                            changePassword();                                        
                          },
                          child: Text("Set Password",
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
    ),
    );           
  }
}

