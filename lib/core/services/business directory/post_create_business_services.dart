import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jci_manila_v2/core/base_api/base_api.dart';
import 'package:jci_manila_v2/core/models/business_model.dart';

class PostCreateBusinessServices {
  final BaseApiServices apiServices;

  PostCreateBusinessServices(this.apiServices);

  Future<Map<String, dynamic>> postCreate({required Business business}) async {
    const endpoint = 'v2.2/business-directory';

    try {
      final headers = await apiServices.getHeaders();
      headers['Content-Type'] = 'application/json';

      final response = await http.post(
        Uri.parse('${apiServices.baseUrl}$endpoint'),
        headers: headers,
        body: jsonEncode(business.toJson()),
      );

      debugPrint("API Request Body: ${business.toJsonString()}");
      debugPrint("API Response: ${response.statusCode} - ${response.body}");

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return {
          "success": true,
          "data": Business.fromJson(jsonDecode(response.body)),
        };
      } else {
        return {
          "success": false,
          "message": "Server error: ${response.statusCode}",
          "error": jsonDecode(response.body),
        };
      }
    } catch (e) {
      debugPrint('API Error: $e');
      return {"success": false, "message": "Network error: ${e.toString()}"};
    }
  }
}
