import 'package:flutter/material.dart';
import 'package:parentseye_user/animations/FadeRoute.dart';
import 'package:parentseye_user/screens/AboutSchool.dart';
import 'package:parentseye_user/screens/ChangePassword.dart';
import 'package:parentseye_user/screens/ContactUs.dart';
import 'package:parentseye_user/screens/Dashboard.dart';
import 'package:parentseye_user/screens/EditLocations.dart';
import 'package:parentseye_user/screens/ExitConfirmationDialog.dart';
import 'package:parentseye_user/screens/Login.dart';
import 'package:parentseye_user/screens/NotificationsAndRemainders.dart';
import 'package:parentseye_user/screens/Profile.dart';
import 'package:parentseye_user/screens/RequestLocationChange.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class Home extends StatefulWidget
{
  final drawerItems = [
    new DrawerItem("Dashboard", Icons.dashboard),
    new DrawerItem("Edit Locations", Icons.edit_location),
    new DrawerItem("Profile", Icons.account_circle),
    new DrawerItem("Notifications And Remainders", Icons.notification_important),
    new DrawerItem("About School", Icons.school),
    new DrawerItem("Contact Us", Icons.contacts),    
    new DrawerItem("Request Location Change", Icons.edit),    
  ];
  @override
  _Home createState() => new _Home();    
}
class _Home extends State<Home>
{
  String appbarTitle = "Dashboard";
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new Dashboard();
      case 1:
        return new EditLocations();
      case 2:
        return new Profile();
      case 3:
        return new NotificationsAndRemainders();
      case 4:
        return new AboutSchool();
      case 5:
        return new ContactUs();
      case 6:
        return new RequestLocationChange();   

      default:
        return new Text("Error");
    }
  }
  _onSelectItem(int index) {
    var d = widget.drawerItems[index];
    setState(() {
      _selectedDrawerIndex = index;
      appbarTitle = d.title;
    });
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  void initState()
  {
    setState(() {
      appbarTitle = "Dashboard";  
    });
    
  }
  
   @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
        new ListTile(          
          leading: new Icon(d.icon),
          title: new Text(d.title,
          style: TextStyle(fontWeight: FontWeight.bold),),
          selected: i == _selectedDrawerIndex,
          onTap: () => _onSelectItem(i),
        )
      );
    }
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
      appBar: new AppBar(
        // here we display the title corresponding to the fragment
        // you can instead choose to have a static title
                  iconTheme: new IconThemeData(color: Colors.black),
            centerTitle: true, 
            title: new Text(appbarTitle,                        
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.0,
            
            color: Colors.black),),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
      ),
      drawer: Theme( 
        data: Theme.of(context).copyWith(
          canvasColor: Colors.amberAccent
        ),
        child: new Drawer(              
        child: new Column(
          children: <Widget>[            
            Row(
              mainAxisAlignment: MainAxisAlignment.center, 
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(                 
                  margin: EdgeInsets.only(top:40.0,bottom: 30.0),
                child: Icon(Icons.home,size: 100.0,),
              ),
              ],
            ),
            new Column(children: drawerOptions)
          ],
        ),
      ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    ),
    );             
  }
}