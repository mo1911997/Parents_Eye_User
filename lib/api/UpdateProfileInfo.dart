import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:parentseye_user/utilities/Constants.dart';

class UpdateProfileInfo 
{
  String url;
  UpdateProfileInfo()
  {

  }
  Future<http.Response> updateProfileInfoFunc(String contact_no,String name,String email,String relation,int id) async
  {
    this.url = Constants.BASE_URL+"";
    http.Response response = await http.post(
      url,
      body: {
        'contact':contact_no,
        'name' : name,
        'email' : email,
        'relation' : relation,
        'id' : id
      },
      headers: {
        'Accept' : 'application/json'
      }
    );
    print(response.body);
    return response;
  }
}