import 'package:http/http.dart' as http;
import 'package:parentseye_user/utilities/Constants.dart';

class SendMessage 
{
  String url;
  SendMessage()
  {

  }
  Future<http.Response> sendMessageFunc(int id,String subject,String message) async
  {
    this.url = Constants.BASE_URL+"";
    http.Response response = await http.post(
      url,
      body: {
        'id': id,
        'contact':subject,
        'password' : message
      },
      headers: {
        'Accept' : 'application/json'
      }   
    );
    print(response.body);
    return response;
  }
}