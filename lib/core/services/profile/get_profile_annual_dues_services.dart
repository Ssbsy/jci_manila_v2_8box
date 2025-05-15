import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jci_manila_v2/core/base_api/base_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetProfileAnnualDuesServices {
  final BaseApiServices apiServices;

  GetProfileAnnualDuesServices(this.apiServices);

  Future<Map<dynamic, dynamic>> getAnnualDues() async {
    const endpoint = 'v2.2/profile/annual-dues';
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("auth_token");
    debugPrint('Stored token: $token');

    final response = await http.get(
      Uri.parse('https://apiv2.jcimanila.com/$endpoint'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      },
    );

    debugPrint("Raw API response: ${response.body}");

    if (response.statusCode < 600) {
      return jsonDecode(response.body);
    } else {
      return {
        "success": false,
        "message": "Server error: ${response.statusCode}",
      };
    }
  }
}
