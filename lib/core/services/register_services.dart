import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jci_manila_v2/core/base_api/base_api.dart';

class RegisterServices {
  final BaseApiServices apiServices;

  RegisterServices(this.apiServices);

  //Register Method with Endpoint
  Future<Map<dynamic, dynamic>> postRegister({
    required String photo,
    required String fullName,
    required String firstName,
    required String lastName,
    required String nickname,
    required String birthday,
    required String address,
    required String contactNo,
    required String school,
    required String profession,
    required String industry,
    required String email,
    required String password,
    required String resume,
    required String sponsorID,
    required String sponsorName,
  }) async {
    const endpoint = 'v2.2/register';
    final body = {
      'photo': photo,
      'fullname': fullName,
      'fname': firstName,
      'lname': lastName,
      'nickname': nickname,
      'bday': birthday,
      'address': address,
      'contactno': contactNo,
      'school': school,
      'profession': profession,
      'industry': industry,
      'email': email,
      'password': password,
      'resume': resume,
      'sponsor_id': sponsorID,
      'sponsor_name': sponsorName,
    };

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
