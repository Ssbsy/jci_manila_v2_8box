import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jci_manila_v2/core/base_api/base_api.dart';

class LoginVerificationServices {
  final BaseApiServices apiServices;

  LoginVerificationServices(this.apiServices);

  Future<Map<String, dynamic>> postVerify({
    required String otp,
    required String email,
  }) async {
    const endpoint = 'v2.2/verify-email';
    final body = {'otp': otp, 'email': email};

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

  Future<Map<String, dynamic>> resendOTP(String email) async {
    final headers = await apiServices.getHeaders();

    final response = await http.post(
      Uri.parse('${apiServices.baseUrl}v2.2/resend-otp'),
      headers: headers,
      body: json.encode({'email': email, 'otp': ''}),
    );

    if (response.statusCode < 600) {
      return json.decode(response.body);
    } else {
      return {'success': false, 'message': 'Failed to resend OTP'};
    }
  }
}
