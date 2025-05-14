import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jci_manila_v2/core/base_api/base_api.dart';

class ProjectByIdServices {
  final BaseApiServices apiServices;

  ProjectByIdServices(this.apiServices);

  Future<Map<String, dynamic>> getProjectById(int projectId) async {
    final endpoint = 'v2.2/projects/$projectId';

    try {
      final headers = await apiServices.getHeaders();
      final response = await http.get(
        Uri.parse('${apiServices.baseUrl}$endpoint'),
        headers: headers,
      );

      debugPrint("ProjectById Response: ${response.body}");

      if (response.statusCode < 600) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        return responseData;
      } else {
        debugPrint("Server error: ${response.statusCode}");
        return {
          "success": false,
          "message": "Server error: ${response.statusCode}",
        };
      }
    } catch (e) {
      debugPrint("Error fetching project by ID: $e");
      return {"success": false, "message": "An error occurred: $e"};
    }
  }
}
