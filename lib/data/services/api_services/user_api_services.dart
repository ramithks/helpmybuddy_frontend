import 'package:flutter/foundation.dart';
import '../../../global_index.dart';

class AuthApiService {
  final customHttpService = CustomHttpService(baseUrl: ApiConstants.baseUrl);

  Future<void> createNewUser(GoogleSignInAccount user) async {
    try {
      const endpoint = 'user/create';

      final requestBody = {
        'full_name': user.displayName,
        'email': user.email,
        'profileImageUrl': user.photoUrl
      };

      final response = await customHttpService.makeSuperExtendedRequest(
        'POST', // HTTP method
        endpoint, // Endpoint path
        [], // No path segments needed in this case
        data: requestBody, // Request body
      );

      if (kDebugMode) {
        print(response);
      } // Handle the response as needed
    } catch (error) {
      if (kDebugMode) {
        print('Error: $error');
      } // Handle the error
    }
  }
}
