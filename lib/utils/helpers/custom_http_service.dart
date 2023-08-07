import 'dart:convert';
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

  Future<Map<String, dynamic>> makeRequest(String method, String endpoint,
      {Map<String, dynamic>? data}) async {
    try {
      late http.Response response;

      switch (method) {
        case 'GET':
          response = await http.get(Uri.parse('$baseUrl/$endpoint'));
          break;
        case 'POST':
          response = await http.post(
            Uri.parse('$baseUrl/$endpoint'),
            body: json.encode(data),
            headers: {'Content-Type': 'application/json'},
          );
          break;
        case 'PUT':
          response = await http.put(
            Uri.parse('$baseUrl/$endpoint'),
            body: json.encode(data),
            headers: {'Content-Type': 'application/json'},
          );
          break;
        case 'DELETE':
          response = await http.delete(Uri.parse('$baseUrl/$endpoint'));
          break;
        default:
          throw UnsupportedMethodException('Unsupported HTTP method: $method');
      }

      return await _handleResponse(response);
    } catch (e) {
      throw NetworkException('Network error: $e');
    }
  }
}

class ClientErrorException implements Exception {
  final String message;
  final int statusCode;

  ClientErrorException(this.message, this.statusCode);
}

class AuthenticationException implements Exception {
  final String message;
  final int statusCode;

  AuthenticationException(this.message, this.statusCode);
}

class AuthorizationException implements Exception {
  final String message;
  final int statusCode;

  AuthorizationException(this.message, this.statusCode);
}

class NotFoundException implements Exception {
  final String message;
  final int statusCode;

  NotFoundException(this.message, this.statusCode);
}

class ServerErrorException implements Exception {
  final String message;
  final int statusCode;

  ServerErrorException(this.message, this.statusCode);
}

class NetworkException implements Exception {
  final String message;

  NetworkException(this.message);
}

class UnsupportedMethodException implements Exception {
  final String message;

  UnsupportedMethodException(this.message);
}
