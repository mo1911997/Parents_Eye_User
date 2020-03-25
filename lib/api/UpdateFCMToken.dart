import 'package:http/http.dart' as http;
import 'package:parentseye_user/utilities/Constants.dart';

class UpdateFCMToken 
{
  String url;
  UpdateFCMToken()
  {

  }
  Future<http.Response> updateFCMTokenFunc(String fcm_token,String token) async
  {
    this.url = Constants.BASE_URL+"";
    http.Response response = await http.post(
      url,
      body: {
        'fcm_token' : fcm_token,                
      },
      headers: {
        'Authorization' : token,
        'Accept' : 'application/json'
      }
    );
    print(response.body);
    return response;
  }
}