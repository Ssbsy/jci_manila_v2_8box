import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:jci_manila_v2/core/base_api/base_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetProfileServices {
  final BaseApiServices apiServices;

  GetProfileServices(this.apiServices);

  Future<Map<String, dynamic>> getProfile() async {
    const endpoint = 'v2.2/profile';
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("auth_token");

    if (token == null) {
      throw Exception("No token found. Please log in again.");
    }

    try {
      final response = await http.get(
        Uri.parse('https://apiv2.jcimanila.com/$endpoint'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      debugPrint("GET $endpoint");
      debugPrint("Status: ${response.statusCode}");
      debugPrint("Response: ${response.body}");

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        throw Exception("Unauthorized: Token may be expired.");
      } else {
        throw Exception("Failed to fetch profile: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Error during profile fetch: $e");
      rethrow;
    }
  }
}
