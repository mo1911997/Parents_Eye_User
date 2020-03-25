import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:parentseye_user/animations/FadeRoute.dart';
import 'package:parentseye_user/utilities/Constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:parentseye_user/screens/ExitConfirmationDialog.dart';
import 'package:parentseye_user/screens/GetOTPAfterGetContact.dart';
import 'package:http/http.dart' as http;
class ContactUs extends StatefulWidget
{
  @override
  _ContactUs createState() => new _ContactUs();    
}
class _ContactUs extends State<ContactUs>
{   
  var token;
  var sendMessageUrl;
  var _storage = FlutterSecureStorage();
  var subjectController = TextEditingController();
  var messageController = TextEditingController();
  callSchool() async {
  const url = 'tel:+91 '+"9423012707";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
  
} 
mailSchool() async {
  const url = 'mailto:hskhedekar@gmail.com';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}  
locationSchool() async
  {
    final url = 'https://www.google.com/maps/search/?api=1&query=16.837908,74.5947012';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sendMessageUrl = Constants.BASE_URL+"testimonials/add_testimonial";
    
  }
  void sendMessage() async
  {
    print(subjectController.text);
    print(messageController.text);    
    token = await _storage.read(key: "token");
    http.Response response = await http.post(
      sendMessageUrl,
      body: {
        'subject' : subjectController.text,
        'message' : messageController.text
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
      if(decodedResponse['state'] == 'success')
      {
        subjectController.clear();
        messageController.clear();
        Fluttertoast.showToast(
                  msg: "Message added successfully !",
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
                child: Icon(                  
                  Icons.contact_mail,size: 100.0,),
              ),
              new Card(
                margin: EdgeInsets.only(top:30.0),
                child: new Container(                  
                  padding: new EdgeInsets.all(32.0),
                  child: new Column(
                    children: <Widget>[
                      Row(children: <Widget>[
                          Container(                             
                        child: new IconButton(
                                          icon: new Icon(Icons.call),
                                          onPressed: () { 
                                            callSchool();
                                          },
                                        ),
                    ),
                        Container(           
                          margin: EdgeInsets.only(left: 20.0),                  
                        child: Text('9900990099',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                    ), 
                      ],),
                                           
                        Row(children: <Widget>[
                          Container( 
                            margin: EdgeInsets.only(top:6.0,right: 15.0),
                        child: new IconButton(
                                          icon: new Icon(Icons.mail),
                                          onPressed: () { 
                                              mailSchool();
                                          },
                                        ),
                    ),
                    //     Container( 
                    //         margin: EdgeInsets.only(top:6.0,left: 20.0),
                    //     child: 
                          
                    // ), 
                        Flexible (                          
                          child: Text('mmd26.aka@gmail.com',                        
                        style: TextStyle(fontWeight: FontWeight.bold),),),                        
                      ],),
                       Row(children: <Widget>[
                          Container( 
                            margin: EdgeInsets.only(top:6.0),
                        child: new IconButton(
                                          icon: new Icon(Icons.location_city),
                                          onPressed: () { 
                                            locationSchool();
                                          },
                                        ),
                    ),
                    Container( 
                            margin: EdgeInsets.only(top:6.0,left: 20.0),
                        child: Text('Pune',
                        style: TextStyle(fontWeight: FontWeight.bold),),
                    ), 
                      ],),
                      Container( 
                        margin: EdgeInsets.only(top:20.0),
                        child: Divider( 
                          thickness: 3.0,
                          height: 8.0,
                          color: Colors.black,
                        ),
                      ),
                      Container( 
                        margin: EdgeInsets.only(top:10.0),
                        child: Text('Send Message'),
                      ),
                      Container( 
                        child: TextField(                          
                        minLines: 1,
                        maxLines: 5,
                        controller: subjectController,
                        keyboardType: TextInputType.multiline,
                         // Only numbers can be entered
                          decoration: InputDecoration(
                            labelText: 'Subject',
                            
                          ),
                        ),
                      ),
                      Container( 
                        child: TextField(                          
                        minLines: 1,
                        controller: messageController,
                        maxLines: 5,
                        keyboardType: TextInputType.multiline,
                         // Only numbers can be entered
                          decoration: InputDecoration(
                            labelText: 'Message',                            
                          ),
                        ),
                      ),
                        Container( 
                          margin: EdgeInsets.only(top: 20.0),
                          child: RaisedButton(                    
                          textColor : Colors.white,    
                          onPressed: () {
                          sendMessage();
                          },
                          child: Text("Send",
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

