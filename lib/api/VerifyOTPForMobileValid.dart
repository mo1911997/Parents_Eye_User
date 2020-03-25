import 'package:http/http.dart' as http;
import 'package:parentseye_user/utilities/Constants.dart';

class VerifyOTPForMobileValid 
{
  String url;
  VerifyOTPForMobileValid()
  {

  }
  Future<http.Response> verifyOTPForMobileValidFunc(String contact_no,int otp) async
  {
    this.url = Constants.BASE_URL+"";
    http.Response response = await http.post(
      url,
      body: {
        'otp' : otp,              
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