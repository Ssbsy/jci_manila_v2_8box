import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jci_manila_v2/core/base_api/base_api.dart';

class LoginServices {
  final BaseApiServices apiServices;

  LoginServices(this.apiServices);

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

      debugPrint("Raw API response: ${response.body}");

      if (response.statusCode < 600) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        return responseData;
      } else {
        debugPrint("Server error: ${response.statusCode} - ${response.body}");
        return {
          "success": false,
          "message": "Server error: ${response.statusCode}",
        };
      }
    } catch (e) {
      debugPrint('$e');
      return {"success": false, "message": "An error occurred: $e"};
    }
  }
}
