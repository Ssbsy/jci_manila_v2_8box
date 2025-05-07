import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jci_manila_v2/core/base_api/base_api.dart';

class LoginServies {
  final BaseApiServices apiServices;

  LoginServies(this.apiServices);

  //Login Method with Endpoint
  Future<Map<String, dynamic>> postLogin({
    required String username,
    required String password,
  }) async {
    const endpoint = 'v2.2/login';
    final body = {'username': username, 'password': password};

    try {
      final headers = await apiServices.getHeaders();
      final response = await http.post(
        Uri.parse('${apiServices.baseUrl}$endpoint'),
        headers: headers,
        body: jsonEncode(body),
      );

      print("Raw API response: ${response.body}");

      if (response.statusCode < 600) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        return responseData;
      } else {
        print("Server error: ${response.statusCode} - ${response.body}");
        return {
          "success": false,
          "message": "Server error: ${response.statusCode}",
        };
      }
    } catch (e) {
      print(e);
      return {"success": false, "message": "An error occurred: $e"};
    }
  }
}
