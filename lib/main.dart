import 'package:flutter/material.dart';
import 'global_index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouterNavigator.generateRoute,
      initialRoute: RoutePaths.onBoardingRoute,
      theme: ThemeData(
          fontFamily: "CocomatPro",
          textTheme: const TextTheme(
            displayLarge: TextStyle(fontWeight: FontWeight.w900), //Black
            displayMedium: TextStyle(fontWeight: FontWeight.w700), //Bold
            bodyLarge: TextStyle(fontWeight: FontWeight.w800), //ExtraBold
            bodyMedium: TextStyle(fontStyle: FontStyle.normal), //normal
            bodySmall: TextStyle(fontWeight: FontWeight.w500), //
          )),
      debugShowCheckedModeBanner: false,
    );
  }
}
