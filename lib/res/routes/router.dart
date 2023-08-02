import 'package:flutter/material.dart';
import '../../global_index.dart';

class RouterNavigator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnbordingScreen());
      case RoutePaths.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RoutePaths.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
