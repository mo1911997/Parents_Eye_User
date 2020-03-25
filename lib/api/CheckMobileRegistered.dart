import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:parentseye_user/utilities/Constants.dart';

class CheckMobileRegistered 
{
  String url;
  CheckMobileRegistered()
  {

  }
  Future<http.Response> checkMobileRegisteredFunc(String contact_no) async
  {
    this.url = Constants.BASE_URL+"parents/check_mobile_no";
    http.Response response = await http.post(
      url,
      body: {
        'contact':contact_no
      },
      headers: {
        'Accept' : 'application/json'
      }
    );
    print(response.body);
    return response;
  }
}