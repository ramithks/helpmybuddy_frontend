import 'package:flutter/material.dart';
import 'package:helpmybuddy_frontend/global_index.dart';

class HamburgerMenu extends StatelessWidget {
  const HamburgerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.thirdBg,
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(height: 20),
          CustomButton(
            verticalPadding: 10,
            backgroundColor: AppColors.secondaryBg,
            radius: 10,
            onPressed: () {
              Navigator.of(context).pop();
              _showConfirmationDialog(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgIcon(
                  IconsAssets.logOutIcon,
                  color: AppColors.white,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "Logout",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ConfirmationDialog(
          titleText: 'Confirm Logout',
          subtitleText: 'Are you sure you want to logout?',
          buttonOneText: 'Cancel',
          buttonTwoText: 'Logout',
          buttonOneOnpressed: () {
            Navigator.of(context).pop();
          },
          buttonTwoOnpressed: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }
}
