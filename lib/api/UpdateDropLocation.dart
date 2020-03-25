import 'package:http/http.dart' as http;
import 'package:parentseye_user/utilities/Constants.dart';

class UpdateDropLocation 
{
  String url;
  UpdateDropLocation()
  {

  }
  Future<http.Response> updateDropLocationFunc(String name,double lat,double long,int student_id) async
  {
    this.url = Constants.BASE_URL+"";
    http.Response response = await http.post(
      url,
      body: {
        'student_id' : student_id,
        'name' : name,
        'lat' : lat,
        'long' : long
      },
      headers: {
        'Accept' : 'application/json'
      }
    );
    print(response.body);
    return response;
  }
}