import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parentseye_user/screens/DropFragmentPickupLocations.dart';
import 'package:parentseye_user/screens/PickupFragmentEditLocations.dart';

class EditLocations extends StatefulWidget
{
  @override
  _EditLocations createState() => new _EditLocations();    
}
class _EditLocations extends State<EditLocations>
{  
  GoogleMapController googleMapController;
  String dropdownValue = "Student One";
  LatLng latLng = const LatLng(16.837908,74.5947012);
  void _onMapCreated(GoogleMapController mapController)
  {
    googleMapController = mapController;
  }
  var dynamicFragForPickupOrDrop; 
  Color pickupAfterClickButtonColor = Colors.red;
  Color dropAfterClickButtonColor = Colors.black;
  void initState()
  {    
    super.initState();
    setState(() {
      dynamicFragForPickupOrDrop = PickupFragmentEditLocations();
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        backgroundColor: Colors.amberAccent,
        body: SingleChildScrollView( 
          child: Column( 
          children: <Widget>[
                  Container(                     
                height: MediaQuery.of(context).size.height/2,
                child: GoogleMap(           
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition( 
                  target: latLng,
                  zoom: 11.0
                )
              ),
            ),
            Card(
                child:
                   Column(                    
                    children: <Widget>[
                       Row( 
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container( 
                                margin: EdgeInsets.only(top: 7.0),
                                child: OutlineButton(
                                  
                                borderSide:BorderSide(color: pickupAfterClickButtonColor,style: BorderStyle.solid),
                                splashColor: Colors.amberAccent,                                
                                highlightedBorderColor: Colors.black,                                  
                                  child: new Text("Pickup",
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
                                  onPressed: () {
                                    setState(() {                                       
                                      pickupAfterClickButtonColor = Colors.red; 
                                      dropAfterClickButtonColor = Colors.black;
                                        dynamicFragForPickupOrDrop = PickupFragmentEditLocations();
                                    });
                                      
                                  },
                                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.horizontal())
                                ),
                              ),
                              Container( 
                                margin: EdgeInsets.only(top: 7.0),
                                child: OutlineButton(
                                borderSide:BorderSide(color: dropAfterClickButtonColor),                                
                                splashColor: Colors.amberAccent,
                                highlightedBorderColor: Colors.black,                                                                  
                                  child: new Text("Drop",
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
                                  onPressed: () {
                                      setState(() {                             
                                        dropAfterClickButtonColor = Colors.red;
                                        pickupAfterClickButtonColor = Colors.black;
                                        dynamicFragForPickupOrDrop = DropFragmentEditLocations();
                                      });
                                  },
                                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.horizontal())
                                ),
                              ),
                                
                            ],                            
                          ),  
                                Divider(
                                  height: 10.0,
                                  thickness: 2.0,
                                  color: Colors.black,
                                ),
                        Column( 
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children : <Widget>[
                            DropdownButton<String>(                                
                                isExpanded: true,
                                value: dropdownValue,
                                // icon: Icon(Icons.arrow_downward),
                                // iconSize: 24,
                                elevation: 16,
                                style: TextStyle(
                                  color: Colors.black
                                ),
                                underline: Container(
                                  height: 2,
                                  color: Colors.amberAccent,
                                ),
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownValue = newValue;
                                  });
                                },
                                items: <String>["Student One", "Student Two", "Student Three", "Student Four"]
                                  .map<DropdownMenuItem<String>>((String value) {
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
                                  })
                                  .toList(),
                              ),
                            dynamicFragForPickupOrDrop,
                          ]
                        ),          

                    ],
                  ),                
              ),
          ],
        ),
      )
        
    );
  }
}