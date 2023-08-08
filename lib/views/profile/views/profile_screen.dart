import 'package:flutter/material.dart';
import '../../../global_index.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            const ProfileTopTile(
              profileImageUrl:
                  'https://cdn.britannica.com/99/236599-050-1199AD2C/Mark-Zuckerberg-2019.jpg',
              profileName: 'Mark Zuck',
              profileSubtitle: 'Not Eligible',
            ),
            const SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.thirdBg,
              ),
              child: InfoTileProfile(
                tileTitle: 'Total Earnings',
                tileSubtitle: '₹0.00',
                onPressed: () {},
                buttonText: 'Withdraw',
                buttonColor: AppColors.white50Opacity,
              ),
            ),
            const SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.thirdBg,
              ),
              child: Column(
                children: [
                  InfoTileProfile(
                    tileTitle: 'Full Name',
                    tileSubtitle: 'NA',
                    onPressed: () {},
                    buttonText: 'Edit',
                    buttonColor: AppColors.secondaryBg,
                  ),
                  InfoTileProfile(
                    tileTitle: 'Connected g-mail account',
                    tileSubtitle: 'mark_zick@gmail.com',
                    onPressed: () {},
                    buttonText: 'disconnect',
                    buttonColor: AppColors.secondaryBg,
                  ),
                  InfoTileProfile(
                    tileTitle: 'Gender',
                    tileSubtitle: 'NA',
                    onPressed: () {},
                    buttonText: 'Edit',
                    buttonColor: AppColors.secondaryBg,
                  ),
                  InfoTileProfile(
                    tileTitle: 'Phone Number',
                    tileSubtitle: 'NA',
                    onPressed: () {},
                    buttonText: 'Edit',
                    buttonColor: AppColors.secondaryBg,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.thirdBg,
              ),
              child: Column(
                children: [
                  InfoTileProfile(
                    tileTitle: 'Location',
                    tileSubtitle: 'NA',
                    onPressed: () {},
                    buttonText: 'Pick',
                    buttonColor: AppColors.secondaryBg,
                  ),
                  InfoTileProfile(
                    tileTitle: 'Address',
                    tileSubtitle: 'NA',
                    onPressed: () {},
                    buttonText: 'Edit',
                    buttonColor: AppColors.secondaryBg,
                  ),
                  InfoTileProfile(
                    tileTitle: 'Aadhar card ( Front side )',
                    tileSubtitle: 'NA',
                    onPressed: () {},
                    buttonText: 'Upload',
                    buttonColor: AppColors.secondaryBg,
                  ),
                  InfoTileProfile(
                    tileTitle: 'UPI ID',
                    tileSubtitle: 'NA',
                    onPressed: () {},
                    buttonText: 'Edit',
                    buttonColor: AppColors.secondaryBg,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
