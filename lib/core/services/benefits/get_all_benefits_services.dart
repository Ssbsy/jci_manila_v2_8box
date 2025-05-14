import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jci_manila_v2/core/base_api/base_api.dart';

class GetAllBenefitsServices {
  final BaseApiServices apiServices;

  GetAllBenefitsServices(this.apiServices);

  Future<Map<dynamic, dynamic>> getAllBenefits() async {
    const endpoint = 'v2.2/benefits/all';

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
