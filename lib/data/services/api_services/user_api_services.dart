import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../global_index.dart';

class AuthApiService {
  final customHttpService = CustomHttpService(baseUrl: ApiConstants.baseUrl);

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

  static Future<void> createNewUser(GoogleSignInAccount user) async {
    
  }
}
