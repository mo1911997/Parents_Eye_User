import 'package:flutter/material.dart';

class PickupDropRemainderDialog extends StatefulWidget
{
  @override
  _PickupDropRemainderDialog createState() => new _PickupDropRemainderDialog();    
}
class _PickupDropRemainderDialog extends State<PickupDropRemainderDialog>
{  
  @override
  Widget build(BuildContext context) {
    
    return  Dialog(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
  child: Container(
    height: 300.0,
    width: 300.0,

    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding:  EdgeInsets.all(15.0),
          child: Text('Cool', style: TextStyle(color: Colors.red),),
        ),
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Text('Awesome', style: TextStyle(color: Colors.red),),
        ),
        Padding(padding: EdgeInsets.only(top: 50.0)),
        FlatButton(onPressed: (){
          Navigator.of(context).pop();
        },
            child: Text('Got It!', style: TextStyle(color: Colors.purple, fontSize: 18.0),))
      ],
    ),
  ),
);  
  }
}

