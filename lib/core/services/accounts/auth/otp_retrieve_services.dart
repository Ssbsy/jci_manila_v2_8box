import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jci_manila_v2/core/base_api/base_api.dart';

class OTPRetrieveServices {
  final BaseApiServices apiServices;

  OTPRetrieveServices(this.apiServices);

  Future<Map<String, dynamic>> postOtpRetrieve({
    required String email,
    required int otp,
  }) async {
    const endpoint = 'OTPRetrieve';
    final body = {'email': email, 'otp': otp};

    try {
      final headers = await apiServices.getHeaders();
      final response = await http.post(
        Uri.parse('${apiServices.baseUrl}$endpoint'),
        headers: headers,
        body: jsonEncode(body),
      );

      debugPrint("Raw OTP Verification Response: ${response.body}");

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
      debugPrint('OTP Verification Error: $e');
      return {"success": false, "message": "An error occurred: $e"};
    }
  }
}
