import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../global_index.dart';

class CustomTextField extends StatelessWidget {
  final String? label, hint;
  final TextEditingController? textController;
  final FocusNode? textFocus;
  final Widget? icon;
  final EdgeInsetsGeometry? padding;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final void Function(String)? onSubmit;
  final TextInputAction? textInputAction;
  final Color? backgroundColor;
  final Function()? onTap;
  final BoxFit iconFit;
  final Widget secondIcon;
  final double iconSize;
  final int? maxLine;
  final Function(String text)? onChange;
  final TextStyle? labelStyle, hintStyle;
  final TextStyle? style;
  final EdgeInsets? contentPadding;
  final double radius;
  final bool svg;
  final List<TextInputFormatter> inputFormatters;

  const CustomTextField(
      {Key? key,
      this.contentPadding,
      this.textController,
      this.maxLine,
      this.labelStyle,
      this.textFocus,
      this.textInputAction,
      this.style,
      this.hint,
      this.label,
      this.iconSize = 20,
      this.onTap,
      this.icon,
      this.iconFit = BoxFit.contain,
      this.obscureText,
      this.padding,
      this.keyboardType,
      this.onSubmit,
      this.onChange,
      this.backgroundColor,
      this.svg = false,
      this.inputFormatters = const [],
      this.secondIcon = const SizedBox(
        height: 0,
        width: 0,
      ),
      this.radius = 20,
      this.hintStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            inputFormatters: inputFormatters,
            controller: textController,
            focusNode: textFocus,
            onChanged: onChange,
            obscureText: obscureText ?? false,
            keyboardType: keyboardType,
            onTap: onTap,
            textAlignVertical: TextAlignVertical.center,
            onSubmitted: (text) {
              if (onSubmit != null) {
                onSubmit!(text);
              }
            },
            textInputAction: TextInputAction.done,
            maxLines: maxLine ?? 1,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius),
                  borderSide: BorderSide.none),
              suffixIcon: secondIcon,
              prefixIcon: icon != null
                  ? svg
                      ? Padding(
                          padding: padding ??
                              const EdgeInsets.symmetric(horizontal: 15),
                          child: SizedBox.square(
                            dimension: iconSize,
                            child: FittedBox(
                              fit: iconFit,
                              child: (icon) ??
                                  SizedBox(width: iconSize, height: iconSize),
                            ),
                          ),
                        )
                      : SizedBox.square(
                          dimension: iconSize,
                          child: (icon) ??
                              SizedBox(width: iconSize, height: iconSize),
                        )
                  : null,
              labelText: label ?? '',
              hintText: hint ?? '',
              filled: true,
              fillColor: backgroundColor,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding:
                  contentPadding ?? const EdgeInsets.symmetric(horizontal: 15),
              hintStyle: hintStyle,
              labelStyle: labelStyle ??
                  TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    color: AppColors.white50Opacity,
                  ),
            ),
            style: style?.copyWith(
                  color: AppColors.white,
                ) ??
                TextStyle(
                  color: AppColors.white50Opacity,
                ),
          ),
        ),
      ],
    );
  }
}
