import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jci_manila_v2/core/base_api/base_api.dart';

class GetGamesCalendarServices {
  final BaseApiServices apiServices;

  GetGamesCalendarServices(this.apiServices);

  Future<Map<dynamic, dynamic>> getCalendar() async {
    const endpoint = 'v2.2/games/calendar?month=2025-05';

    try {
      final headers = await apiServices.getHeaders();
      final response = await http.get(
        Uri.parse('${apiServices.baseUrl}$endpoint'),
        headers: headers,
      );

      debugPrint("Raw API response: ${response.body}");

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
      debugPrint('$e');
      return {"success": false, "message": "An error occurred: $e"};
    }
  }
}
