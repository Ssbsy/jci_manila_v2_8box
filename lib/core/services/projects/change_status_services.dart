import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jci_manila_v2/core/base_api/base_api.dart';

class ChangeStatusServices {
  final BaseApiServices apiServices;

  ChangeStatusServices(this.apiServices);

  Future<Map<String, dynamic>> patchChangeStatus({
    required String status,
  }) async {
    const endpoint = 'v2.2/update-project/:id';

    try {
      final headers = await apiServices.getHeaders();
      final response = await http.patch(
        Uri.parse('${apiServices.baseUrl}$endpoint'),
        headers: headers,
        body: jsonEncode({'status': status}),
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
