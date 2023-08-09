import 'package:flutter/material.dart';
import '/global_index.dart';

class ProvideHelpScreen extends StatefulWidget {
  const ProvideHelpScreen({Key? key}) : super(key: key);

  @override
  State<ProvideHelpScreen> createState() => _ProvideHelpScreenState();
}

class _ProvideHelpScreenState extends State<ProvideHelpScreen> {
  bool _isPolicyAccepted = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.thirdBg,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.only(
          top: 15.0,
          bottom: 15.0,
          left: 30.0,
          right: 30.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomBackbutton(
              title: 'Provide Help',
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(height: 10),
            ProfileTopTile(
              showEditIcon: false,
              profileImageUrl:
                  'https://cdn.britannica.com/99/236599-050-1199AD2C/Mark-Zuckerberg-2019.jpg',
              profileName: 'Mark Zuck',
              profileSubtitle: 'Added 1 Hrs Ago',
              profileSubtitleColor: AppColors.white50Opacity,
            ),
            const SizedBox(height: 10),
            const CustomInfo(
              titleText: 'Write hand written assignment',
              subTitleText:
                  'Help me to write a hand written assignment on A4 paper  .Torto vel fames est posuere. Et suspendisse sem dui faucius.  Pellentesque varius sit amet nunc. Quam gravida vitae sit ornare suscipit. In morbi scelerisque ultrices suspendisse cursus quis turpis amet ut. Volutpat sem lobortis diam phasellus sollicitudin amet. Enim malesuada bibendum vestibulum in mi mattis volutpat etiam. Accumsan diam felis fermentum nisi cras aliquet viverra. Posuere lacus massa porta tincidunt tincidunt et dictum. Nunc nisi bibendum elit ut. Enim sit proin odio condimentum. Ullamcorper enim egestas sit cursus eget. Pulvinar tortor non lorem et in auctor egestas. Facilisi aliquet elit aliquet in viverra enim elementum augue enim. Sapien egestas quis scelerisque adipiscing elementum tincidunt est orci.\n\nAc lobortis risus gravida vulputate et tristique morbi blandit morbi. Vulputate amet id metus magna. Ultricies maecenas morbi mattis eget varius nibh morbi montes scelerisque. Egestas massa sed quis ut lacus dui leo. Aliquam non purus ullamcorper lectus libero amet interdum velit. Maecenas phasellus lobortis ullamcorper eget integer.',
            ),
            const SizedBox(height: 30),
            const CustomInfo(
              titleTextSize: 24,
              subTitleTextSize: 14,
              titleText: 'Comment/Note :',
              subTitleText:
                  'The topic is “Music therapy” and send it to my mail . and the assignment should five pages long . don’t print it . hand written.',
            ),
            const SizedBox(height: 20),
            CustomButton(
              radius: 10,
              verticalPadding: 12,
              horizontalPadding: 12,
              backgroundColor: AppColors.secondaryBg,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgIcon(
                        IconsAssets.mapIcon,
                        height: 13,
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        "3 Kms from you",
                        style: TextStyle(
                            color: AppColors.green,
                            fontSize: 12,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  Text(
                    "Get Direction",
                    style: TextStyle(
                      color: AppColors.white50Opacity,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.secondaryBg,
              ),
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  '8963 ,Spencer Springs,885 Lucas Highway Bengaluru, Karnataka, India - 560085',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const CustomInfo(
              titleTextSize: 18,
              subTitleTextSize: 10,
              titleText: 'You will Earn : ₹299',
              subTitleText:
                  'We will transfer your earnings to your UPI ID once the total earnings are greater than ₹3000',
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Checkbox(
                  checkColor: AppColors.white,
                  hoverColor: AppColors.black,
                  value: _isPolicyAccepted,
                  onChanged: (value) {
                    setState(() {
                      _isPolicyAccepted = value!;
                    });
                  },
                ),
                const Text(
                  'I accept the Privacy Policy',
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomButton(
                    radius: 15,
                    verticalPadding: 15,
                    horizontalPadding: 15,
                    child: const Text(
                      textAlign: TextAlign.center,
                      "Confirm Providing Help",
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
