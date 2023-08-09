import 'package:flutter/material.dart';
import '/global_index.dart';

class AskHelpHome extends StatelessWidget {
  const AskHelpHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.mainBg,
      child: const Center(
        child: Text(
          "Tab makeover in progress 👷\nShhh, it's a secret 🤫",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
