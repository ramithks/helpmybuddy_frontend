import 'package:flutter/material.dart';
import '../../../global_index.dart';

class ProfileTopTile extends StatelessWidget {
  final String profileImageUrl;
  final String profileName;
  final String profileSubtitle;

  const ProfileTopTile({
    Key? key, // Use the correct syntax for the key parameter
    required this.profileImageUrl,
    required this.profileName,
    required this.profileSubtitle,
  }) : super(key: key); // Initialize the super constructor properly

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(300.0),
              child: CustomImage(
                imageUrl: profileImageUrl,
              ),
            ),
            Positioned(
              top: -10,
              right: -10,
              child: IconButton(
                onPressed: () {
                  // Handle edit icon tap here
                },
                icon: SvgIcon(
                  IconsAssets.editIcon,
                  width: 20,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 3),
        Expanded(
          child: ListTile(
            title: Text(
              profileName,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              profileSubtitle,
              style: TextStyle(
                color: AppColors.red,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
