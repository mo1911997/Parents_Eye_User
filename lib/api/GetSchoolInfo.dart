import 'package:http/http.dart' as http;
import 'package:parentseye_user/utilities/Constants.dart';

class GetSchoolInfo 
{
  String url;
  GetSchoolInfo()
  {

  }
  Future<http.Response> getSchoolInfoFunc(int stud_id) async
  {
    this.url = Constants.BASE_URL+"";
    http.Response response = await http.post(
      url,
      body: {
        'stud_id' : stud_id,        
      },
      headers: {
        'Accept' : 'application/json'
      }
    );
    print(response.body);
    return response;
  }
}