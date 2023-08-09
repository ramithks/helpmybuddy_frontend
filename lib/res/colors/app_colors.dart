import 'package:flutter/material.dart';

class AppColors {
  // Background Colors
  static const Color mainBg = Color(0xFF0C1017);
  static const Color secondaryBg = Color(0xFF14181C);
  static const Color thirdBg = Color(0xFF21262D);

  // Foreground Colors
  static const Color mainFg = Color(0xFFFF914D);
  static const Color orangeLight = Color(0xFFFFCFB1);

  // Opacity colors

  static Color white50Opacity =
      const Color(0x80FFFFFF).withOpacity(0.5); //white - 50% opacity
  static Color black80Opacity =
      const Color(0xCC000000).withOpacity(0.8); // black - 80% opacity
  static Color black70Opacity =
      const Color(0xCC000000).withOpacity(0.7); // black - 80% opacity
  static Color opaqueColor =
      const Color(0x80FFFFFF).withOpacity(0.0); //white - 100% opacity

//Others
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static Color orange = Colors.orange;
  static Color red = Colors.red;
  static const Color green = Color(0xFF00AE2F);
}
