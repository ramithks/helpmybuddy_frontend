import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http; 
import '../../../global_index.dart';

class AuthApiService {
  Future<UserModel> getCurrentUser() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.profile);

      final response = await http.get(url);

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON
        final jsonBody = json.decode(response.body);
        return UserModel.fromJson(jsonBody);
      } else {
        if (kDebugMode) {
          print("FAILED");
        }
        // If the server did not return a 200 OK response, throw an exception.
        throw Exception('Failed to load user information');
      }
    } catch (e) {
      if (kDebugMode) {
        print("FAILED");
      }
      // If there's an error during the HTTP request, throw an exception.
      throw Exception('Failed to connect to the server');
    }
  }
}
