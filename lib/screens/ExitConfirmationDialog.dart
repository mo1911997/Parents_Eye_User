import 'dart:io';

import 'package:flutter/material.dart';

class ExitConfirmationDialog extends StatefulWidget
{
  @override
  _ExitConfirmationDialog createState() => new _ExitConfirmationDialog();    
}
class _ExitConfirmationDialog extends State<ExitConfirmationDialog>
{  
  @override
  Widget build(BuildContext context) {
    
      return AlertDialog(
        title: Text('Are you sure you want to Exit ?'),        
        actions: <Widget>[
          FlatButton(
            child: Text('Yes'),
            onPressed: () {
             exit(0);
            },
          ),
          FlatButton(
            child: Text('No'),
            onPressed: () {
              Navigator.pop(context, AlertDialog);
            },
          ),
        ],
      );   
  }
}

