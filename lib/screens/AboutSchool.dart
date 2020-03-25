import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
class AboutSchool extends StatefulWidget
{
  @override
  _AboutSchool createState() => new _AboutSchool();    
}
class _AboutSchool extends State<AboutSchool>
{  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        backgroundColor: Colors.amberAccent,
        body: SingleChildScrollView( 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card( 
                child : Container( 
                  child: Column( 

                  children: <Widget>[
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: CachedNetworkImageProvider(
                              'https://picsum.photos/250?image=10',
                            ),
                          ),
                        ),
                      ),
                      Container( 
                        margin: EdgeInsets.only(top:30.0),
                        child: Text('St. Teresa Convent School',
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
                      ),
                      Container(
                        margin: EdgeInsets.only(top:30.0,bottom: 20.0,left: 6.0,right: 6.0),
                        child:                         
                        Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16.0),),),                                        
                  ],
                ),
                )                
              ),              
            ],),
        ),
    );
  }
}