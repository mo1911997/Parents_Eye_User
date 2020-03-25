import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:parentseye_user/animations/FadeRoute.dart';
import 'package:flip_card/flip_card.dart';
import 'package:http/http.dart' as http;
import 'package:parentseye_user/utilities/Constants.dart';
class Profile extends StatefulWidget
{
  @override
  _Profile createState() => new _Profile();    
}
class _Profile extends State<Profile>
{  
  String nameShow,emailShow,contactShow,relationShow;
  var token;
  var get_profile_data_url;
  var update_profile_data_url;
  bool showChip = false;
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  TextEditingController nameUpdateController =  TextEditingController();
  TextEditingController relationUpdateController = TextEditingController();
  TextEditingController contactUpdateController = TextEditingController();
  TextEditingController emailUpdateController = TextEditingController();    
  final _storage = FlutterSecureStorage();
  @override
  void initState()
  {
    super.initState();
    // loadChip();
    // loadChip2();
    getProfileData();
    nameUpdateController.text = "Mohit Dixit";
    relationUpdateController.text = "Father";  
    contactUpdateController.text = "9900990099";  
    emailUpdateController.text = "arkinindia2018@gmail.com";  
    get_profile_data_url  = Constants.BASE_URL+"parents/get_profile_data";
    update_profile_data_url  = Constants.BASE_URL+"parents/update_user";
    
    // setState(() {
      
    // });
  }
  // loadChip() 
  // {
  //   print('inhere');
  //   Future.delayed(const Duration(seconds: 2), () {
  //           setState(() {
  //             showChip = true;
  //           });
  //         });            
  // }
  // loadChip2()
  // {
  //   setState(() {
  //     showChip = false;
  //   });
  // }
  void getProfileData() async
  {
    token = await _storage.read(key: "token");
    print(token);
    http.Response response = await http.get(
      get_profile_data_url,       
      headers: {
        "Accept" : "application/json",
        "Authorization" : "Bearer "+token
      }
    );
    print(response.body);
    if(response.statusCode == 200)
    {
      setState(() {
        var decodedResponse = json.decode(response.body);
        nameUpdateController.text = decodedResponse['name'];
        relationUpdateController.text = decodedResponse['relation'];  
        contactUpdateController.text = decodedResponse['contact'];  
        emailUpdateController.text = decodedResponse['email'];    

        nameShow = decodedResponse['name'];
        contactShow = decodedResponse['contact'];
        // emailShow = decodedResponse['email'];
        relationShow = decodedResponse['relation'];
      });        
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
        body: ListView(           
          children: <Widget>[
            Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Visibility( 
              //   visible: showChip,                                
              //   child: 
              //           Chip(
              //             backgroundColor: Colors.white30,
              //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))),
              //       label: Text('Here\'s your profile info !'),
              //     ),
              // ),    
              Container( 
                
                child: Icon(                  
                  Icons.account_box,size: 100.0,),
              ),         
              FlipCard(
                    key: cardKey,                    
                    flipOnTouch: false,
                    direction: FlipDirection.HORIZONTAL, // default
                    front: Container(
                        margin: EdgeInsets.only(top:30.0),
                          child: new Card(
                              child: new Container(
                                padding: new EdgeInsets.all(32.0),
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                      new IconButton(
                                          icon: new Icon(Icons.edit),
                                          onPressed: () { 
                                            cardKey.currentState.toggleCard();
                                          },
                                        )
                                    ],),
                                    Container( 
                                      margin: EdgeInsets.only(top:20.0),
                                      child: Row(                                      
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Icon(Icons.party_mode),
                                        Text(nameShow,                                        
                                        style: TextStyle(fontWeight: FontWeight.bold),)
                                    ],),
                                    ),
                                    
                                      Container( 
                                        margin: EdgeInsets.only(top:20.0),
                                      child: Row(                                      
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Icon(Icons.child_care),
                                        Text(relationShow,
                                        style: TextStyle(fontWeight: FontWeight.bold),)
                                    ],),
                                    ),
                                      Container( 
                                        margin: EdgeInsets.only(top:20.0),
                                      child: Row(                                      
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Icon(Icons.call),
                                        Text(contactShow,
                                        style: TextStyle(fontWeight: FontWeight.bold),)
                                    ],),
                                    ),
                                    //   Container( 
                                    //     margin: EdgeInsets.only(top:20.0),
                                    //   child: Row(                                      
                                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //   children: <Widget>[
                                    //     Icon(Icons.email),
                                    //     Text(emailShow,
                                    //     style: TextStyle(fontWeight: FontWeight.bold),),
                                    // ],),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                      ),
                      back: Container(
                          child: new Card(
                              child: new Container(
                                padding: new EdgeInsets.all(32.0),
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                      Text('Update Information',
                                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
                                    ],),
                                    TextField(
                                      controller: nameUpdateController,
                                      keyboardType: TextInputType.text,
                                      // Only numbers can be entered
                                        // decoration: InputDecoration(
                                        //   labelText: 'Enter your contact number',
                                          
                                        // ),
                                      ),
                                      TextField(
                                        controller: relationUpdateController,
                                      keyboardType: TextInputType.text,
                                      // Only numbers can be entered
                                        // decoration: InputDecoration(
                                        //   labelText: 'Enter your contact number',
                                          
                                        // ),
                                      ),
                                      TextField(
                                        controller: contactUpdateController,
                                      keyboardType: TextInputType.text,                        
                                      // Only numbers can be entered
                                        // decoration: InputDecoration(
                                        //   labelText: 'Enter your contact number',
                                          
                                        // ),
                                      ),
                                      TextField(
                                        controller: emailUpdateController,
                                      keyboardType: TextInputType.text,
                                      // Only numbers can be entered
                                        // decoration: InputDecoration(
                                        //   labelText: 'Enter your contact number',
                                          
                                        // ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                           Container( 
                                        margin: EdgeInsets.only(top: 20.0),
                                        child: RaisedButton(                    
                                        textColor : Colors.white,    
                                        onPressed: () {
                                          
                                        },
                                        child: Text("Update",
                                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
                                        color: Colors.lightBlueAccent,
                                      ),
                                    ),
                                    Container( 
                                        margin: EdgeInsets.only(top: 20.0),
                                        child: RaisedButton(                    
                                        textColor : Colors.white,    
                                        onPressed: () {
                                          cardKey.currentState.toggleCard();
                                        },
                                        child: Text("Cancel",
                                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
                                        color: Colors.lightBlueAccent,
                                      ),
                                    ),   
                                      ],),
                                                                                  
                                  ],
                                ),
                              ),
                            ),
                      ),
                  ),                              
                        
            ],
          ),
        ),
      ),
          ],
    )
    );    
  }
}