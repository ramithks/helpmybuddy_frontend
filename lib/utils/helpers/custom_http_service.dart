import 'dart:convert';
import '../../global_index.dart';
import 'package:http/http.dart' as http;

class CustomHttpService {
  final String baseUrl;

  CustomHttpService({required this.baseUrl});

  Future<Map<String, dynamic>> _handleResponse(http.Response response) async {
    final responseBody = response.body;
    final statusCode = response.statusCode;

    switch (statusCode) {
      case 200:
        if (responseBody.isNotEmpty) {
          return json.decode(responseBody);
        } else {
          return {};
        }
      case 201:
        // Handle successful creation
        return {};
      case 400:
        throw ClientErrorException('Bad request', statusCode);
      case 401:
        throw AuthenticationException('Unauthorized', statusCode);
      case 403:
        throw AuthorizationException('Forbidden', statusCode);
      case 404:
        throw NotFoundException('Not found', statusCode);
      case 500:
        throw ServerErrorException('Internal server error', statusCode);
      default:
        throw Exception('Unexpected error: $statusCode');
    }
  }

  Future<Map<String, dynamic>> makeSuperExtendedRequest(
    String method,
    String endpoint,
    List<String> pathSegments, {
    String? token,
    Map<String, dynamic>? data,
    Map<String, String>? queryParameters,
  }) async {

      late http.Response response;

      final uri = Uri.parse('$baseUrl/$endpoint${pathSegments.join('/')}');

      switch (method) {
        case 'GET':
          response = await http.get(
            uri,
            headers: token != null ? {'Authorization': 'Bearer $token'} : null,
          );
          break;
        case 'POST':
          response = await http.post(
            uri,
            body: json.encode(data),
            headers: {
              'Content-Type': 'application/json',
              if (token != null) 'Authorization': 'Bearer $token'
            },
          );
          break;
        case 'PUT':
          response = await http.put(
            uri,
            body: json.encode(data),
            headers: {
              'Content-Type': 'application/json',
              if (token != null) 'Authorization': 'Bearer $token'
            },
          );
          break;
        case 'DELETE':
          response = await http.delete(
            uri,
            headers: token != null ? {'Authorization': 'Bearer $token'} : null,
          );
          break;
        default:
          throw UnsupportedMethodException('Unsupported HTTP method: $method');
      }

      return await _handleResponse(response);
  
  }
}
