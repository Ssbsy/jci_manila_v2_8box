import 'package:shared_preferences/shared_preferences.dart';

class BaseApiServices {
  final String baseUrl = 'https://apiv2.jcimanila.com/';

  //Get header method
  Future<Map<String, String>> getHeaders() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("auth_token");

    return {
      'content-type': 'application/json',
      'accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }
}
