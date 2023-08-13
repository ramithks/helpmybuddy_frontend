import 'package:flutter/foundation.dart';
import '../../../global_index.dart';

class AuthApiService {
  final customHttpService = CustomHttpService(baseUrl: ApiConstants.baseUrl);

  Future<void> createNewUser() async {
    try {
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
      } else {
        SnackbarUtils.showSnackbar(
          type: SnackbarType.error,
          message: 'Sign in Failed',
        );
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error: $error');
      }
    }
  }
}
