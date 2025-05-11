import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jci_manila_v2/core/base_api/base_api.dart';

class AllEventsService {
  final BaseApiServices apiServices;

  AllEventsService(this.apiServices);

  Future<Map<String, dynamic>> getAllEvents() async {
    const endpoint = 'Events';

    try {
      final headers = await apiServices.getHeaders();
      final response = await http.get(
        Uri.parse('${apiServices.baseUrl}$endpoint'),
        headers: headers,
      );

      debugPrint("Raw API response: ${response.body}");

      if (response.statusCode < 600) {
        final decoded = jsonDecode(response.body);

        if (decoded is List) {
          return {"success": true, "data": decoded};
        } else if (decoded is Map<String, dynamic>) {
          return decoded;
        } else {
          return {"success": false, "message": "Unexpected response format"};
        }
      } else {
        debugPrint("Server error: ${response.statusCode} - ${response.body}");
        return {
          "success": false,
          "message": "Server error: ${response.statusCode}",
        };
      }
    } catch (e) {
      debugPrint('Error fetching all events: $e');
      return {"success": false, "message": "An error occurred: $e"};
    }
  }
}
