import 'package:flutter/material.dart';
import '../../../global_index.dart';

class TaskInfoCard extends StatelessWidget {
  const TaskInfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String titleText = 'Write hand written assignment';
    String subTitleText =
        'Help me to write a hand written assignment on A4 paper  .Torto vel fames est posuere. Et suspendisse sem dui faucius.  Pellentesque varius sit amet nunc. Quam gravida vitae sit ornare suscipit. In morbi scelerisque ultrices suspendisse cursus quis turpis amet ut. Volutpat sem lobortis diam phasellus sollicitudin amet. Enim malesuada bibendum vestibulum in mi mattis volutpat etiam. Accumsan diam felis fermentum nisi cras aliquet viverra. Posuere lacus massa porta tincidunt tincidunt et dictum. Nunc nisi bibendum elit ut. Enim sit proin odio condimentum. Ullamcorper enim egestas sit cursus eget. Pulvinar tortor non lorem et in auctor egestas. Facilisi aliquet elit aliquet in viverra enim elementum augue enim. Sapien egestas quis scelerisque adipiscing elementum tincidunt est orci.';
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.thirdBg,
      ),
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
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  child: SvgIcon(IconsAssets.arrowTilted),
                  onTap: () {
                    //open the task detailed view
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
