import 'package:flutter/material.dart';
import '../../global_index.dart';

class ProfileTopTile extends StatelessWidget {
  final String profileImageUrl;
  final String profileName;
  final String profileSubtitle;
  final Color profileSubtitleColor;
  final bool showEditIcon; // Add a boolean property to control icon visibility

  const ProfileTopTile({
    Key? key,
    required this.profileImageUrl,
    required this.profileName,
    required this.profileSubtitle,
    required this.profileSubtitleColor,
    this.showEditIcon = true, // Set a default value for showEditIcon
  }) : super(key: key);

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
            if (showEditIcon) // Conditionally show the icon based on the boolean
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
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              profileSubtitle,
              style: TextStyle(
                color: profileSubtitleColor,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
