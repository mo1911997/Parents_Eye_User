import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:parentseye_user/animations/FadeRoute.dart';
import 'package:parentseye_user/screens/Home.dart';
import 'package:parentseye_user/screens/GetOTPAfterGetContact.dart';
import 'package:http/http.dart' as http;
import 'package:parentseye_user/utilities/Constants.dart';
class ConfirmChildren extends StatefulWidget
{
  @override
  _ConfirmChildren createState() => new _ConfirmChildren();    
}
class _ConfirmChildren extends State<ConfirmChildren>
{  
  var token;
  var url;
  final _storage = FlutterSecureStorage();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    url = Constants.BASE_URL+"parents/get_parent_info";
    getStudentsInfoWithParents();
  }
  void getStudentsInfoWithParents() async
  {
    token = await _storage.read(key: "token");
    http.Response response = await http.post( 
      url,
      body: {

      },
      headers: {
        "Accept" : "application/json",
        "Authorization" : "Bearer "+token
      }
    );
    print(response.body);
    if(response.statusCode == 200)
    {
      var decodedResponse = json.decode(response.body);      
      print(decodedResponse['data']);
      for(var i in decodedResponse['data'])
      {
        print(i['student_id']);
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Card(
                child: new Container(
                  padding: new EdgeInsets.all(32.0),
                  child: new Column(
                    children: <Widget>[
                      Text("Confirm your children !"),
                      Container(
                            height: 144.0,                            
                            child: ListView(
                              scrollDirection: Axis.vertical,                              
                              children: <Widget>[
                                Text('1 . Ramesh'),
                                Padding(padding: EdgeInsets.all(5.00)),
                                Text('2 . Suresh'),
                              ],
                            ),
                          ),
                        Container( 
                          margin: EdgeInsets.only(top: 20.0),
                          child: RaisedButton(                    
                          textColor : Colors.white,    
                          onPressed: () {
                            Navigator.push(context, 
                           FadeRoute(page: Home()));
                          },
                          child: Text("Confirm",
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
    );            
  }
}

