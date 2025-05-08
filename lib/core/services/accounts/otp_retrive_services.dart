import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jci_manila_v2/core/base_api/base_api.dart';

class OTPRetriveService {
  final BaseApiServices apiServices;

  OTPRetriveService(this.apiServices);

  Future<Map<String, dynamic>> postOtpRetrieve({
    required String email,
    required int otp,
  }) async {
    const endpoint = '/OTPRetrive';
    final body = {'email': email, 'otp': otp};

    try {
      final headers = await apiServices.getHeaders();
      final uri = Uri.parse('${apiServices.baseUrl}$endpoint');

      final response = await http.post(
        uri,
        headers: {...headers, 'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      debugPrint("OTP Retrieve Response: ${response.body}");

      if (response.statusCode < 600) {
        return jsonDecode(response.body);
      } else {
        return {
          'success': false,
          'message': 'Server error: ${response.statusCode}',
        };
      }
    } catch (e) {
      debugPrint('OTP Retrieve Error: $e');
      return {'success': false, 'message': 'Exception: $e'};
    }
  }
}
