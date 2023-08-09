import 'package:flutter/material.dart';
import 'package:helpmybuddy_frontend/global_index.dart';

class ConfirmationDialog extends StatelessWidget {
  final String titleText;
  final String subtitleText;
  final String buttonOneText;
  final String buttonTwoText;
  final VoidCallback buttonOneOnpressed;
  final VoidCallback buttonTwoOnpressed;

  const ConfirmationDialog({
    Key? key,
    required this.titleText,
    required this.subtitleText,
    required this.buttonOneText,
    required this.buttonTwoText,
    required this.buttonOneOnpressed,
    required this.buttonTwoOnpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: AppColors.thirdBg,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              titleText,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12.0),
            Text(
              subtitleText,
              style: TextStyle(
                color: AppColors.white50Opacity,
              ),
            ),
            const SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                  backgroundColor: AppColors.opaqueColor,
                  onPressed: buttonOneOnpressed,
                  child: Text(
                    buttonOneText,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                CustomButton(
                  backgroundColor: AppColors.red,
                  onPressed: buttonTwoOnpressed,
                  child: Text(
                    buttonTwoText,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
