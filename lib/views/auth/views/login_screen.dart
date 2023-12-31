import 'package:flutter/material.dart';

import '../../../global_index.dart';

class LoginScreen extends StatelessWidget {
  final AuthApiService _authApiService = AuthApiService();

  attemptUserCreation() async {
    AuthApiService authService = AuthApiService();
    try {
      var result = await authService.createNewUser();

      print(result
          .token); // Now you're printing the result of createNewUser function
    } catch (e) {
      print(e); // If there was an error, print it
    }
  }

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBg,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgIcon(
                IconsAssets.loginIllHey,
              ),
              const SizedBox(height: 30),
              const Text(
                "welcome to",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: AppColors.white,
                  fontSize: 50,
                ),
              ),
              SvgIcon(
                IconsAssets.logo,
              ),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Friends ',
                      style: TextStyle(
                        color: AppColors.white,
                      ),
                    ),
                    TextSpan(
                      text: 'Helping ',
                      style: TextStyle(
                        color: AppColors.mainFg,
                      ),
                    ),
                    TextSpan(
                      text: 'friends',
                      style: TextStyle(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              CustomButton(
                backgroundColor: AppColors.white,
                radius: 15,
                verticalPadding: 15,
                onPressed: () async {
                  attemptUserCreation();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgIcon(
                      IconsAssets.googleLogo,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Sign In with Google",
                      style: TextStyle(
                        color: AppColors.black70Opacity,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 15),

              /*
              CustomButton(
                backgroundColor: AppColors.thirdBg,
                radius: 15,
                verticalPadding: 15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgIcon(
                      IconsAssets.appleLogo,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      "Sign In with Apple",
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
                onPressed: () {
                  SnackbarUtils.showSnackbar(
                      type: SnackbarType.error, message: 'Sign in Failed');
                  // Inside a function or widget
                },
              ),

              */
            ],
          ),
        ),
      ),
    );
  }
}
