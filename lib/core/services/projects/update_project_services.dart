import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jci_manila_v2/core/base_api/base_api.dart';

class UpdateProjectServices {
  final BaseApiServices apiServices;

  UpdateProjectServices(this.apiServices);

  Future<Map<String, dynamic>> updateProject({
    required int projectId,
    required String title,
    required String description,
    required String startDate,
    required String endDate,
    required String overview,
    required String objective,
    required int chairman,
    required int directorates,
    List<Map<String, dynamic>>? committees,
  }) async {
    final endpoint = 'v2.2/projects/$projectId';

    final Map<String, dynamic> body = {
      "title": title,
      "description": description,
      "start_date": startDate,
      "end_date": endDate,
      "overview": overview,
      "objective": objective,
      "chairman": chairman,
      "directorates": directorates,
    };

    if (committees != null && committees.isNotEmpty) {
      body["committees"] = committees;
    }

    try {
      final headers = await apiServices.getHeaders();
      final response = await http.patch(
        Uri.parse('${apiServices.baseUrl}$endpoint'),
        headers: {...headers, "Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      debugPrint("UpdateProject Response: ${response.body}");

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
      debugPrint("Error updating project: $e");
      return {"success": false, "message": "An error occurred: $e"};
    }
  }
}
