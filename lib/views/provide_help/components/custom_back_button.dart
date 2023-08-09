import 'package:flutter/material.dart';
import '../../../global_index.dart';

class CustomBackbutton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const CustomBackbutton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      backgroundColor: AppColors.opaqueColor,
      onPressed: onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgIcon(
            IconsAssets.backArrow,
            height: 20,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            title,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
