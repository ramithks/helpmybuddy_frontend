import 'package:flutter/foundation.dart';

import '../../../global_index.dart';

class AuthApiService {
  final customHttpService = CustomHttpService(baseUrl: ApiConstants.baseUrl);

  Future<UserModel> createNewUser() async {
    final user = await GoogleSignInApi.login();

    if (user != null) {
      final pathSegments = [ApiConstants.user, ApiConstants.create];

      final requestBody = {
        'full_name': user.displayName,
        'email': user.email,
        'profileImageUrl': user.photoUrl
      };

      final response = await customHttpService.makeSuperExtendedRequest(
        'POST',
        '',
        pathSegments,
        data: requestBody,
      );

      if (kDebugMode) {
        print(response);
      }

      // Parse and return token and user data
      if (response['token'] is String && response['token'] != '') {
        final userModel = UserModel.fromJson(response);
        return userModel;
      } else {
        throw Exception('Failed to create user');
      }
      // return requestBody;
    } else {
      SnackbarUtils.showSnackbar(
        type: SnackbarType.error,
        message: 'Sign in Failed',
      );
      throw Exception('Google sign in failed');
    }
  }
}
