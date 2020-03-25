import 'package:flutter/material.dart';
import 'package:parentseye_user/screens/PickupDropRemainderDialog.dart';

class NotificationsAndRemainders extends StatefulWidget
{
  @override
  _NotificationsAndRemainders createState() => new _NotificationsAndRemainders();    
}
class _NotificationsAndRemainders extends State<NotificationsAndRemainders>
{  
  bool _isChecked = true;
  String _currText = '';
  List<String> text = ["Pickup Notification", "Drop Notification", "Reached At School","Left From School"];
  void getDialog()
  {
     showDialog(
        context: context, builder: (BuildContext context) => PickupDropRemainderDialog());
  }
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
                
                child: Icon(                  
                  Icons.notifications,size: 70.0,),
              ),                                
              new Card(
                margin: EdgeInsets.only(top:30.0),
                child: new Container(
                  padding: new EdgeInsets.all(32.0),
                  child: new Column(
                    children: <Widget>[
                      Text('Remainders',
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column( 
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              
                              Container(            
                          margin: EdgeInsets.only(top:20.0),                 
                        child: Text('Pickup',
                        style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        Container(                                      
                        child: Text('1.0 Km before'),                        
                        ),
                      ],                                                    
                    ), 
                     Container(            
                          margin: EdgeInsets.only(top:20.0),                                         
                        child: FlatButton( 
                          onPressed: getDialog,
                          child: Text('Change',                        
                        style: TextStyle(color: Colors.lightBlueAccent),),
                        ),
                    ), 
                    
                      ],),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                        
                          Column( 
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              
                              Container(            
                          margin: EdgeInsets.only(top:20.0),                 
                        child: Text('Drop',
                        style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        Container(                                      
                        child: Text('1.0 Km before'),                        
                        ),
                      ],                                                    
                    ), 
                     Container(            
                          margin: EdgeInsets.only(top:20.0),                 
                        child: FlatButton( 
                          onPressed: getDialog,                          
                          child: Text('Change',                        
                        style: TextStyle(color: Colors.lightBlueAccent),),
                        ),
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
                        margin: EdgeInsets.only(top:20.0,bottom: 20.0),
                        child: Text('Notification Alerts',
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
                      ),
                      Column(
                                children: text
                                    .map((t) => CheckboxListTile(
                                          title: Text(t),
                                          value: _isChecked,
                                          onChanged: (val) {
                                            setState(() {
                                              print(val);
                                              _isChecked = val;
                                              if (val == true) {
                                               _currText = t;
                                              }
                                            });
                                          },
                                        ))
                                    .toList(),
                              ),                            
                      //   Container( 
                      //     margin: EdgeInsets.only(top: 20.0),
                      //     child: RaisedButton(                    
                      //     textColor : Colors.white,    
                      //     onPressed: () {
                      //     //   Navigator.push(context, 
                      //     //  FadeRoute(page: GetOTPAfterGetContact()));
                      //     },
                      //     child: Text("Send",
                      //     style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
                      //     color: Colors.lightBlueAccent,
                      //   ),
                      // ),                                            
                    ],
                  ),
                ),
              ),              
            ],
          ),
        ),
      ),
    ),
    );
  }
}