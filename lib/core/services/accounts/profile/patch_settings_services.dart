import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jci_manila_v2/core/base_api/base_api.dart';

class PatchSettingsServices {
  final BaseApiServices apiServices;

  PatchSettingsServices(this.apiServices);

  Future<Map<String, dynamic>> patchSettings({
    required int showNofif,
    required int showBday,
    required int showPrimaryContactInfo,
    required int showEducationInfo,
    required int showProfessionInfo,
    required int showCivilStatus,
    required int showSecondaryContactInfo,
  }) async {
    const endpoint = 'v2.2/settings';
    final body = {
      'show_notifications': showNofif,
      'show_bday': showBday,
      'show_primary_contact_info': showPrimaryContactInfo,
      'show_education_info': showEducationInfo,
      'show_profession_info': showProfessionInfo,
      'show_civil_status': showCivilStatus,
      'show_secondary_contact_info': showSecondaryContactInfo,
    };

    try {
      final headers = await apiServices.getHeaders();
      final response = await http.patch(
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
