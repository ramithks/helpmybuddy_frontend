import 'package:flutter/material.dart';
import '../../../global_index.dart';

class CustomInfo extends StatelessWidget {
  final String titleText;
  final String subTitleText;
  final double? titleTextSize;
  final double? subTitleTextSize;

  const CustomInfo({
    Key? key,
    required this.titleText,
    required this.subTitleText,
    this.titleTextSize = 26,
    this.subTitleTextSize = 14,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titleText,
              style: TextStyle(
                color: AppColors.white,
                fontSize: titleTextSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              subTitleText,
              style: TextStyle(
                color: AppColors.white50Opacity,
                fontSize: subTitleTextSize,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
