import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jci_manila_v2/core/base_api/base_api.dart';

class AddUserBenefitsServices {
  final BaseApiServices apiServices;

  AddUserBenefitsServices(this.apiServices);

  Future<Map<String, dynamic>> addBenefits({
    required int benefitID,
    required int userID,
  }) async {
    const endpoint = 'v2.2/benefits/user';
    final body = {'benefit_id': benefitID, 'user_id': userID};

    try {
      final headers = await apiServices.getHeaders();
      final response = await http.post(
        Uri.parse('${apiServices.baseUrl}$endpoint'),
        headers: headers,
        body: jsonEncode(body),
      );

      debugPrint("Raw API response: ${response.body}");

      if (response.statusCode < 600) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        return responseData;
      } else {
        debugPrint("Server error: ${response.statusCode} - ${response.body}");
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
