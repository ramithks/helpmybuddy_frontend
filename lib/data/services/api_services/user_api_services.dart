import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../global_index.dart';

class AuthApiService {
  static Future<void> saveUserData(GoogleSignInAccount user) async {
    final url =
        '${ApiConstants.baseUrl}${ApiConstants.user}/create'; // Replace with your API endpoint.

    final response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        'full_name': user.displayName,
        'email': user.email,
        'profileImageUrl': user.photoUrl,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to save user data');
    }
  }
}
