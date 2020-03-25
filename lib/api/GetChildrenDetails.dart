import 'package:http/http.dart' as http;
import 'package:parentseye_user/utilities/Constants.dart';

class GetChildrenDetails 
{
  String url;
  GetChildrenDetails()
  {

  }
  Future<http.Response> getChildrenDetailsFunc(int id) async
  {
    this.url = Constants.BASE_URL+"";
    http.Response response = await http.post(
      url,
      body: {
        'id': id,        
      },
      headers: {
        'Accept' : 'application/json'
      }
    );
    print(response.body);
    return response;
  }
}