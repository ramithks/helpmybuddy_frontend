import 'package:flutter/material.dart';

import '../../../global_index.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.mainBg,
      child: const Text(
        "This is profile page",
        style: TextStyle(color: AppColors.white),
      ),
    );
  }
}
