import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jci_manila_v2/core/base_api/base_api.dart';

class GetBodListServices {
  final BaseApiServices apiServices;

  GetBodListServices(this.apiServices);

  Future<Map<String, dynamic>> getBodList() async {
    const endpoint = 'v2.2/bod-list/';

    try {
      final headers = await apiServices.getHeaders();
      final response = await http.get(
        Uri.parse('${apiServices.baseUrl}$endpoint'),
        headers: headers,
      );

      debugPrint("Status Code: ${response.statusCode}");
      debugPrint("Raw API response: ${response.body}");

      if (response.statusCode >= 200 && response.statusCode < 300) {
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
      debugPrint('Error: $e');
      return {"success": false, "message": "An error occurred: $e"};
    }
  }
}
