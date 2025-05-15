import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jci_manila_v2/core/base_api/base_api.dart';

class AddProjectService {
  final BaseApiServices apiServices;

  AddProjectService(this.apiServices);

  Future<Map<String, dynamic>> postProject(Map<String, dynamic> payload) async {
    const endpoint = 'v2.2/projects';

    try {
      final headers = await apiServices.getHeaders();
      final response = await http.post(
        Uri.parse('${apiServices.baseUrl}$endpoint'),
        headers: headers,
        body: jsonEncode(payload),
      );

      if (response.statusCode < 600) {
        final responseData = jsonDecode(response.body);
        return responseData;
      } else {
        return {
          'success': false,
          'message': 'Server error: ${response.statusCode}',
        };
      }
    } catch (e) {
      return {'success': false, 'message': 'An error occurred: $e'};
    }
  }
}
