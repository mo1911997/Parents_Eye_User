import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parentseye_user/animations/FadeRoute.dart';
import 'package:flip_card/flip_card.dart';

class DropFragmentEditLocations extends StatefulWidget {
  @override
  _DropFragmentEditLocations createState() => _DropFragmentEditLocations();
}

class _DropFragmentEditLocations extends State<DropFragmentEditLocations> {
  String dropdownValue = "Location One";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: new EdgeInsets.all(22.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            DropdownButton<String>(
              isExpanded: true,
              value: dropdownValue,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.black),
              underline: Container(
                height: 2,
                color: Colors.amberAccent,
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: <String>[
                "Location One",
                "Location Two",
                "Location Three",
                "Location Four"
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: SizedBox(
                    width: 100.0,
                    child: Text(
                      value,
                      textAlign: TextAlign.center, //this will do that
                    ),
                  ),
                );
              }).toList(),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: RaisedButton(
                textColor: Colors.white,
                onPressed: () {
                  //   Navigator.push(context,
                  //  FadeRoute(page: GetOTPAfterGetContact()));
                },
                child: Text(
                  "Set",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                color: Colors.lightBlueAccent,
              ),
            ),
          ],
        ));
  }
}
