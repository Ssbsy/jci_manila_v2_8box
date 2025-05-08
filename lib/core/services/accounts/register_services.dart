import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:jci_manila_v2/core/base_api/base_api.dart';

class RegisterServices {
  final BaseApiServices apiServices;

  RegisterServices(this.apiServices);

  Future<Map<String, dynamic>> postRegister({
    required Map<String, dynamic> data,
    File? photoFile,
    File? resumeFile,
  }) async {
    const endpoint = '/v2.2/register';
    try {
      final headers = await apiServices.getHeaders();
      final uri = Uri.parse('${apiServices.baseUrl}$endpoint');
      final request = http.MultipartRequest('POST', uri)
        ..headers.addAll(headers);

      data.forEach((key, value) {
        if (value != null) {
          request.fields[key] = value.toString();
        }
      });

      if (photoFile != null) {
        final mimeType = lookupMimeType(photoFile.path);
        if (mimeType != null) {
          request.files.add(
            await http.MultipartFile.fromPath(
              'photo',
              photoFile.path,
              contentType: MediaType.parse(mimeType),
            ),
          );
        }
      }

      if (resumeFile != null) {
        final mimeType = lookupMimeType(resumeFile.path);
        if (mimeType != null) {
          request.files.add(
            await http.MultipartFile.fromPath(
              'resume',
              resumeFile.path,
              contentType: MediaType.parse(mimeType),
            ),
          );
        }
      }

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode < 600) {
        return jsonDecode(response.body);
      } else {
        return {
          'success': false,
          'message': 'Server error: ${response.statusCode}',
        };
      }
    } catch (e) {
      return {'success': false, 'message': 'Exception: $e'};
    }
  }
}
