import 'package:dio/dio.dart';

import '../../global_index.dart';

class CustomHttpService {
  final String baseUrl;
  final Dio _dio;

  CustomHttpService({required this.baseUrl})
      : _dio = Dio(BaseOptions(baseUrl: baseUrl));

  Future<Map<String, dynamic>> makeSuperExtendedRequest(
    String method,
    String endpoint,
    List<String> pathSegments, {
    String? token,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    late Response<Map<String, dynamic>> response;

    final uri = Uri.parse('$baseUrl/$endpoint${pathSegments.join('/')}');

    try {
      switch (method) {
        case 'GET':
          response = await _dio.get<Map<String, dynamic>>(
            uri.toString(),
            options: Options(
                headers:
                    token != null ? {'Authorization': 'Bearer $token'} : null),
          );
          break;
        case 'POST':
          response = await _dio.post<Map<String, dynamic>>(
            uri.toString(),
            data: data,
            options: Options(
              headers: {
                'Content-Type': 'application/json',
                if (token != null) 'Authorization': 'Bearer $token'
              },
            ),
          );
          break;
        case 'PUT':
          response = await _dio.put<Map<String, dynamic>>(
            uri.toString(),
            data: data,
            options: Options(
              headers: {
                'Content-Type': 'application/json',
                if (token != null) 'Authorization': 'Bearer $token'
              },
            ),
          );
          break;
        case 'DELETE':
          response = await _dio.delete<Map<String, dynamic>>(
            uri.toString(),
            options: Options(
                headers:
                    token != null ? {'Authorization': 'Bearer $token'} : null),
          );
          break;
        default:
          throw UnsupportedMethodException('Unsupported HTTP method: $method');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        final statusCode =
            e.response!.statusCode ?? -1; // Default value in case it's null
        throw CustomHttpException(
            e.response!.data['message'] ?? 'HTTP Error', statusCode);
      } else {
        throw NetworkException('Network error: $e');
      }
    }

    return response.data!;
  }
}
