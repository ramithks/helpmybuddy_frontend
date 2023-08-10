import 'package:flutter/material.dart';
import '../../../global_index.dart';

class InfoTileProfile extends StatelessWidget {
  final String tileTitle;
  final String tileSubtitle;
  final VoidCallback onPressed;
  final Color buttonColor;
  final String buttonText;

  const InfoTileProfile({
    super.key,
    required this.tileTitle,
    required this.tileSubtitle,
    required this.onPressed,
    required this.buttonColor,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 15,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Expanded(
              child: ListTile(
                title: Text(
                  tileTitle,
                  style: TextStyle(
                    color: AppColors.white50Opacity,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  tileSubtitle,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            CustomButton(
              radius: 10,
              verticalPadding: 10,
              horizontalPadding: 15,
              onPressed: onPressed,
              backgroundColor: buttonColor,
              child: Text(
                buttonText,
                style: const TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
