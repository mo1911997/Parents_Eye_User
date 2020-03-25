import 'package:http/http.dart' as http;
import 'package:parentseye_user/utilities/Constants.dart';

class UpdateDropRemainder 
{
  String url;
  UpdateDropRemainder()
  {

  }
  Future<http.Response> updateDropRemainderFunc(double value) async
  {
    this.url = Constants.BASE_URL+"";
    http.Response response = await http.post(
      url,
      body: {
        'value' : value,              
      },
      headers: {
        'Accept' : 'application/json'
      }
    );
    print(response.body);
    return response;
  }
}