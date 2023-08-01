import 'package:flutter/material.dart';
import '../../global_index.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final VoidCallback onPressed;
  final double? radius;
  final double? verticalPadding;
  final double? horizontalPadding;
  const CustomButton(
      {required this.child,
      required this.onPressed,
      this.backgroundColor,
      this.radius,
      this.verticalPadding,
      this.horizontalPadding,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 5),
      child: Material(
        color: backgroundColor ?? AppColors.mainFg,
        child: InkWell(
          onTap: onPressed,
          child: Container(
            color: (backgroundColor == null) ? AppColors.mainFg : null,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: verticalPadding ?? 5,
                horizontal: horizontalPadding ?? 10,
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
