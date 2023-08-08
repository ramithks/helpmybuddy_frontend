import 'package:flutter/material.dart';
import '../../global_index.dart';

class SvgIcon extends SvgPicture {
  final String svg;
  final BoxFit iconFit;

  SvgIcon(this.svg,
      {Key? key,
      Color? color,
      double? height,
      double? width,
      this.iconFit = BoxFit.contain,
      final WidgetBuilder? errorBuilder})
      : super.string(
          svg,
          key: key,
          colorFilter: color == null
              ? null
              : ColorFilter.mode(color, BlendMode.srcIn), // Use color filter
          height: height,
          width: width,
          fit: iconFit,
        );

  SvgIcon.asset(this.svg,
      {Key? key,
      Color? color,
      double? height,
      double? width,
      this.iconFit = BoxFit.none,
      final WidgetBuilder? errorBuilder})
      : super.asset(
          svg,
          key: key,
          colorFilter: color == null
              ? null
              : ColorFilter.mode(color, BlendMode.srcIn), // Use color filter
          height: height,
          width: width,
          fit: iconFit,
        );

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return svg;
  }
}
