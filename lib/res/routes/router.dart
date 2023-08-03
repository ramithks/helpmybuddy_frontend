import 'package:flutter/material.dart';
import 'package:helpmybuddy_frontend/views/main/views/main_page.dart';
import '../../global_index.dart';

class RouterNavigator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnbordingScreen());
      case RoutePaths.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case RoutePaths.mainRoute:
        return MaterialPageRoute(builder: (_) => MainPage());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
