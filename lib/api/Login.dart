import 'package:http/http.dart' as http;
import 'package:parentseye_user/utilities/Constants.dart';

class Login 
{
  String url;
  Login()
  {

  }
  Future<http.Response> loginFunc(String contact_no,String password) async
  {
    this.url = Constants.BASE_URL+"";
    http.Response response = await http.post(
      url,
      body: {
        'contact':contact_no,
        'password' : password
      },
      headers: {
        'Accept' : 'application/json'
      }
    );
    print(response.body);
    return response;
  }
}
