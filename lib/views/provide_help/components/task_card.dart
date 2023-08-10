import 'package:flutter/material.dart';
import '../../../global_index.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String titleText = 'Write hand written assignment';
    String subTitleText =
        'Help me to write a hand written assignment on A4 paper  .Torto vel fames est posuere. Et suspendisse sem dui faucius.Pellentesque varius sit amet nunc. Quam gravida vitae sit ornare suscipit. In morbi scelerisque ultrices suspendisse cursus quis turpis amet ut. Volutpat sem lobortis diam phasellus sollicitudin amet. Enim malesuada bibendum vestibulum in mi mattis volutpat etiam. Accumsan diam felis fermentum nisi cras aliquet viverra. Posuere lacus massa porta tincidunt tincidunt et dictum. Nunc nisi bibendum elit ut. Enim sit proin odio condimentum. Ullamcorper enim egestas sit cursus eget. Pulvinar tortor non lorem et in auctor egestas. Facilisi aliquet elit aliquet in viverra enim elementum augue enim. Sapien egestas quis scelerisque adipiscing elementum tincidunt est orci.';
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Rounded corners
      ),
      color: AppColors.thirdBg,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            ProfileTopTile(
              showEditIcon: false,
              profileImageUrl:
                  'https://cdn.britannica.com/99/236599-050-1199AD2C/Mark-Zuckerberg-2019.jpg',
              profileName: 'Mark Zuck',
              profileSubtitle: 'Added 1 Hrs Ago',
              profileSubtitleColor: AppColors.white50Opacity,
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: Text(
                        titleText.length > 15
                            ? '${titleText.substring(0, 15)}..'
                            : titleText,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        subTitleText.length > 55
                            ? '${subTitleText.substring(0, 55)}..'
                            : subTitleText,
                        style: TextStyle(
                          color: AppColors.white50Opacity,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                  radius: 10,
                  verticalPadding: 10,
                  horizontalPadding: 10,
                  backgroundColor: AppColors.secondaryBg,
                  child: Row(
                    children: [
                      SvgIcon(
                        IconsAssets.mapIcon,
                        height: 13,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      const Text(
                        "3 Kms from you",
                        style: TextStyle(
                            color: AppColors.green,
                            fontSize: 10,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
                CustomButton(
                  verticalPadding: 9,
                  horizontalPadding: 9,
                  radius: 12,
                  child: Row(
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Earn ₹250",
                            style: TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "Provide Help",
                            style: TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      SvgIcon(
                        color: AppColors.thirdBg,
                        IconsAssets.arrowTilted,
                        height: 35,
                      ),
                    ],
                  ),
                  onPressed: () => BottomSheetUtils.showBottomSheet(context),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
