import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jci_manila_v2/core/base_api/base_api.dart';

class UpdatePasswordService {
  final BaseApiServices apiServices;

  UpdatePasswordService(this.apiServices);

  Future<Map<String, dynamic>> postUpdatePassword({
    required String email,
    required String password,
    required int otp,
  }) async {
    const endpoint = 'UpdatePassword';
    final body = {'email': email, 'password': password, 'otp': otp};

    try {
      final headers = await apiServices.getHeaders();
      final uri = Uri.parse('${apiServices.baseUrl}$endpoint');

      final response = await http.post(
        uri,
        headers: {...headers, 'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      debugPrint("Update Password Response: ${response.body}");

      if (response.statusCode < 600) {
        return jsonDecode(response.body);
      } else {
        return {
          'success': false,
          'message': 'Server error: ${response.statusCode}',
        };
      }
    } catch (e) {
      debugPrint('Update Password Error: $e');
      return {'success': false, 'message': 'Exception: $e'};
    }
  }
}
